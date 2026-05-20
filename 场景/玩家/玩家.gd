class_name 玩家类型
extends CharacterBody3D

@onready var 相机支点: Node3D = $相机支点
@onready var 移动: 移动组件 = %移动
@onready var 输入: 输入组件 = %输入
@onready var 相机: 相机组件 = %相机
@onready var 相机同步器: RemoteTransform3D = $相机支点/弹簧臂/相机同步器

@export var 俯仰限制: float = 75.0
@export_range(0, 1, 0.1) var 视角灵敏度: float = 0.1


const SPEED = 5.0 
const JUMP_VELOCITY = 4.5


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	移动.move.connect(_on_move)
	输入.移动.connect(_on_移动)
	输入.跳跃.connect(_on_跳跃)
	输入.鼠标偏移.connect(_on_鼠标偏移) 

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("切换场景"):
		场景管理器.切换场景("res://场景/UI/主菜单/主菜单.tscn")
		 

func 设置相机(camera: Camera3D):
	if 相机:
		相机.活动相机 = camera
		相机同步器.remote_path = camera.get_path()

func _physics_process(delta: float) -> void:
	移动.is_on_floor = is_on_floor()

func _on_move(vel: Vector3):
	velocity = vel
	move_and_slide()
 
func _on_移动(输入向量: Vector2):
	var direction := (transform.basis * Vector3(输入向量.x, 0, 输入向量.y)).normalized()
	移动.direction = direction 

func _on_跳跃():
	if Input.is_action_just_pressed("跳跃") and is_on_floor():
		移动.is_jumping = true

func _on_鼠标偏移(偏移量: Vector2):
	相机.鼠标偏移处理(偏移量)
