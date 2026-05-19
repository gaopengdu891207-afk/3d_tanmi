class_name 玩家类型
extends CharacterBody3D

@onready var 摄像机: Camera3D = $摄像机

@export var 俯仰限制: float = 45
@export_range(0, 1, 0.1) var 视角灵敏度: float = 0.1

const SPEED = 5.0 
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("跳跃") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var input_dir := Input.get_vector("向左", "向右", "向前", "向后")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
		velocity.z = move_toward(velocity.z, 0, SPEED * delta)

	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and not (event.relative as Vector2).is_zero_approx():
		self.rotate_y(deg_to_rad(-event.relative.x * 视角灵敏度))
		摄像机.rotate_x(deg_to_rad(-event.relative.y * 视角灵敏度))
		摄像机.rotation_degrees.x = clamp(摄像机.rotation_degrees.x,-俯仰限制,俯仰限制)
	
 
