extends Node3D

@onready var 玩家: 玩家类型 = $玩家
@onready var camera_3d: Camera3D = $Camera3D

func _ready() -> void:
	玩家.设置相机(camera_3d)
	状态管理器.切换状态(状态管理器.游戏状态.游戏中)

func _process(delta: float) -> void:
	pass
