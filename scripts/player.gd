class_name Player extends CharacterBody2D

signal died

const SPEED: int = 100
const JUMP_VELOCITY: float = -300.0
const ANIMATION_IDLE: String = "idle"
const ANIMATION_WALK: String = "walk"
const ANIMATION_JUMP: String = "jump"
const VIDA_MAXIMA: int = 3
@onready var animated: AnimatedSprite2D = %AnimatedSprite2D


var vida: int = VIDA_MAXIMA
var moedas: int = 0
var jump_count: int = 0
var max_jumps: int = 1
var has_double_jump_unlocked: bool = false
var _double_jump_timer: float = 0.0


func receber_dano(dano: int) -> void:
	if vida <= 0:
		return

	vida -= dano
	print("Vida atual: ", vida)

	if vida <= 0:
		print("O jogador morreu!")
		set_physics_process(false)
		died.emit()
		$GameOverSound.play()
		await $GameOverSound.finished
		get_tree().call_deferred("reload_current_scene")
	else:
		$HitSound.play()


func adicionar_moedas(quantidade: int) -> void:
	moedas += quantidade
	print("Moedas coletadas: ", moedas)

func recuperar_vida(quantidade: int) -> void:
	if vida > 0:
		vida = mini(vida + quantidade, VIDA_MAXIMA)

func _process(delta: float) -> void:
	if _double_jump_timer > 0.0:
		_double_jump_timer -= delta
		if _double_jump_timer <= 0.0:
			_disable_temp_double_jump()


func unlock_double_jump(duration: float = 10.0) -> void:
	has_double_jump_unlocked = true
	max_jumps = 2
	jump_count = 0
	_double_jump_timer = maxf(duration, 0.0)


func _disable_temp_double_jump() -> void:
	has_double_jump_unlocked = false
	max_jumps = 1
	jump_count = mini(jump_count, max_jumps)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0

	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
		$JumpSound.play()

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	_update_animations(direction)
	move_and_slide()

	if global_position.y > 160:
		receber_dano(vida)


func _update_animations(direction: float) -> void:
	if not is_on_floor():
		animated.play(ANIMATION_JUMP)
		animated.flip_h = direction < 0
	elif direction != 0:
		animated.play(ANIMATION_WALK)
		animated.flip_h = direction < 0
	else:
		animated.play(ANIMATION_IDLE)


func _on_enemy_damage_requested(target: Node, amount: int) -> void:
	if target == self:
		receber_dano(amount)
