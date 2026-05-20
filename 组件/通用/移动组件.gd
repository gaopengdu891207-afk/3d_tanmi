class_name 移动组件
extends 组件基类

signal move(vel:Vector3)

@export var 速度: float = 5.0
@export var 跳跃冲量: float = 4.5
@export var 是否应用重力: bool = true

var _重力: float = ProjectSettings.get("physics/3d/default_gravity")

var is_on_floor: bool = false
var is_jumping: bool = false

var direction: Vector3 = Vector3.ZERO
var velocity: Vector3 = Vector3.ZERO


func  _physics_process(delta: float) -> void:
	if not is_on_floor and 是否应用重力:
		velocity.y -= _重力 * delta
	if is_jumping:
		velocity.y = 跳跃冲量
		is_jumping = false
	if direction:
		velocity.x = direction.x * 速度
		velocity.z = direction.z * 速度
	else:
		velocity.x = move_toward(velocity.x, 0, 速度 * delta)
		velocity.z = move_toward(velocity.z, 0, 速度 * delta)
	if 是否启用:
		move.emit(velocity)

func 设置重力(value: float):
	_重力 = value
