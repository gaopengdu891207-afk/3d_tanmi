extends Node

var 当前场景: Node


func _ready() -> void:
	当前场景 = get_tree().current_scene

func 切换场景(场景路径: String):
	get_tree().change_scene_to_file(场景路径)
