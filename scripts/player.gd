class_name Player extends CharacterBody2D


const SPEED:int = 100
const JUMP_VELOCITY:float = -300.0
const ANIMATION_IDLE:String = "idle"
const ANIMATION_WALK:String = "walk"
const ANIMATION_JUMP:String = "jump"
const MAX_JUMP_COUNT:int = 2

@onready var animated: AnimatedSprite2D = %AnimatedSprite2D

var jump_count:int = 0

var max_jumps: int = 1
var has_double_jump_unlocked: bool = false
var _double_jump_timer: float = 0.0


func _process(delta: float) -> void:
	if _double_jump_timer > 0.0:
		_double_jump_timer -= delta
		if _double_jump_timer <= 0.0:
			_disable_temp_double_jump()


func unlock_double_jump(duration: float = 10.0) -> void:
	has_double_jump_unlocked = true
	max_jumps = 2
	jump_count = 0
	if duration > 0.0:
		_double_jump_timer = duration
	else:
		_double_jump_timer = 0.0


func _disable_temp_double_jump() -> void:
	has_double_jump_unlocked = false
	max_jumps = 1
	if jump_count > max_jumps:
		jump_count = max_jumps



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or jump_count < max_jumps):
		velocity.y = JUMP_VELOCITY
		jump_count += 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	_update_animations(direction)
	move_and_slide()

func _update_animations(direction:float) -> void:
	
	if not is_on_floor():
		animated.play(ANIMATION_JUMP)
		animated.flip_h = direction < 0
	else:
		if direction != 0:
			animated.play(ANIMATION_WALK)
			animated.flip_h = direction < 0
		else:
			animated.play(ANIMATION_IDLE)
