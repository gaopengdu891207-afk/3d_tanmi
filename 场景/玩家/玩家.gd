class_name 玩家类型
extends CharacterBody3D

@onready var 相机支点: Node3D = $相机支点
@onready var 移动: 移动组件 = %移动

@export var 俯仰限制: float = 75.0
@export_range(0, 1, 0.1) var 视角灵敏度: float = 0.1

const SPEED = 5.0 
const JUMP_VELOCITY = 4.5


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	移动.move.connect(_on_move)

func _physics_process(delta: float) -> void:
	移动.is_on_floor = is_on_floor()

	if Input.is_action_just_pressed("跳跃") and is_on_floor():
		移动.is_jumping = true

	var input_dir := Input.get_vector("向左", "向右", "向前", "向后")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	移动.direction = direction 

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and not (event.relative as Vector2).is_zero_approx():
		self.rotate_y(deg_to_rad(-event.relative.x * 视角灵敏度))
		相机支点.rotate_x(deg_to_rad(-event.relative.y * 视角灵敏度))
		相机支点.rotation_degrees.x = clamp(相机支点.rotation_degrees.x,-俯仰限制,俯仰限制)

func _on_move(vel: Vector3):
	velocity = vel
	move_and_slide()
 
