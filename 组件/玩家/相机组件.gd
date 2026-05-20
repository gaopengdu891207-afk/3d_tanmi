class_name 相机组件
extends 组件基类

@export var 俯仰限制: float = 75.0
@export_range(0, 1, 0.1) var 视角灵敏度: float = 0.1
 
@export var 玩家: 玩家类型
@export var 活动相机: Camera3D
@export var 相机支点: Node3D
@export var 弹簧臂: SpringArm3D


func 鼠标偏移处理(偏移量: Vector2):
	if 玩家:
		玩家.rotate_y(deg_to_rad(-偏移量.x * 视角灵敏度))
	if 相机支点:
		相机支点.rotate_x(deg_to_rad(-偏移量.y * 视角灵敏度))
		相机支点.rotation_degrees.x = clamp(相机支点.rotation_degrees.x,-俯仰限制,俯仰限制)
