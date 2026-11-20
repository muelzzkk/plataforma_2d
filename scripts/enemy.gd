
class_name PatrolEnemy
extends CharacterBody2D

## Evento enviado quando o jogador recebe dano por contato.
## O sistema de vida poderá conectar-se a este sinal posteriormente.
signal damage_requested(target: Node, amount: int)

## Configurações do inimigo.
@export_range(1.0, 150.0, 1.0)
var move_speed: float = 35.0

@export_range(8.0, 160.0, 1.0)
var patrol_distance: float = 40.0

@export_range(1, 99, 1)
var damage_amount: int = 1

## Cena responsável pelo indicador visual de dano.
const DAMAGE_NUMBER_SCENE: PackedScene = preload(
    "res://scenes/damage_number.tscn"
)

## Referências aos nós da cena.
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var damage_area: Area2D = $DamageArea
@onready var floor_check: RayCast2D = $FloorCheck

## Controle da movimentação.
var _patrol_origin_x: float
var _direction: float = 1.0


func _ready() -> void:
    _patrol_origin_x = global_position.x

    damage_area.body_entered.connect(
        _on_damage_area_body_entered
    )

    animated_sprite.play("walk")


func _physics_process(delta: float) -> void:

    # Aplica gravidade quando o inimigo está no ar.
    if not is_on_floor():
        velocity.y += get_gravity().y * delta

    # Verifica se existe chão na direção do movimento.
    floor_check.position.x = 10.0 * _direction
    floor_check.force_raycast_update()

    # Verifica os limites da patrulha.
    if global_position.x >= _patrol_origin_x + patrol_distance:
        _direction = -1.0

    elif global_position.x <= _patrol_origin_x - patrol_distance:
        _direction = 1.0

    # Verifica paredes e ausência de chão.
    elif is_on_wall() or (
        is_on_floor() and not floor_check.is_colliding()
    ):
        _direction *= -1.0

    # Atualiza a velocidade horizontal.
    velocity.x = move_speed * _direction

    # Espelha o sprite conforme a direção.
    animated_sprite.flip_h = _direction < 0.0

    move_and_slide()


func _on_damage_area_body_entered(body: Node2D) -> void:

    # Apenas o personagem do jogador pode receber dano.
    if not body is Player:
        return

    # Comunica o evento ao sistema externo de vida.
    damage_requested.emit(body, damage_amount)

    # Exibe o indicador visual.
    _show_damage_number(body.global_position)


func _show_damage_number(target_position: Vector2) -> void:

    var damage_number := DAMAGE_NUMBER_SCENE.instantiate()

    get_tree().current_scene.add_child(damage_number)

    damage_number.global_position = (
        target_position + Vector2(0.0, -12.0)
    )

    damage_number.call("set_damage", damage_amount)
