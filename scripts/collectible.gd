class_name Collectible
extends Area2D

enum ItemType {
	COIN,
	HEAL,
	DOUBLE_JUMP,
}

## Sinais desacoplados para HUD, sistema de vida (John) e áudio (Samuel).
signal collected(item_type: ItemType, value: int, player: Player)
signal coin_collected(amount: int)
signal heal_requested(target: Player, amount: int)
signal double_jump_granted(target: Player, duration: float)

@export var item_type: ItemType = ItemType.COIN
@export_range(1, 999, 1) var value: int = 1
@export_range(0.0, 60.0, 0.5) var powerup_duration: float = 10.0
@export var bob_amplitude: float = 3.0
@export var bob_speed: float = 4.0
@export var idle_animation: String = "default"

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var _base_y: float = 0.0
var _time_acc: float = 0.0
var _is_collected: bool = false


func _ready() -> void:
	_base_y = position.y
	body_entered.connect(_on_body_entered)

	if animated_sprite and animated_sprite.sprite_frames:
		if animated_sprite.sprite_frames.has_animation(idle_animation):
			animated_sprite.play(idle_animation)


func _process(delta: float) -> void:
	if _is_collected or bob_amplitude <= 0.0:
		return
	_time_acc += delta * bob_speed
	position.y = _base_y + sin(_time_acc) * bob_amplitude


func _on_body_entered(body: Node2D) -> void:
	if _is_collected:
		return
	if not (body is Player):
		return

	_is_collected = true
	var player := body as Player

	match item_type:
		ItemType.COIN:
			coin_collected.emit(value)
		ItemType.HEAL:
			heal_requested.emit(player, value)
		ItemType.DOUBLE_JUMP:
			if player.has_method("unlock_double_jump"):
				player.unlock_double_jump(powerup_duration)
			double_jump_granted.emit(player, powerup_duration)

	collected.emit(item_type, value, player)
	queue_free()
