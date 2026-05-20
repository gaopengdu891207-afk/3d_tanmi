extends Node

var 当前场景: Node
var 历史场景: Array[String] = []


func _ready() -> void:
	当前场景 = get_tree().current_scene

func 切换场景(场景路径: String):
	#get_tree().change_scene_to_file(场景路径)
	#await get_tree().create_timer(1).timeout
	#当前场景 = get_tree().current_scene
	#print("当前场景是%s" % 当前场景)
	if 当前场景 and 当前场景.scene_file_path:
		历史场景.append(当前场景.scene_file_path)
		当前场景.queue_free()
	
	var packed: PackedScene = load(场景路径)
	var 新场景:Node = packed.instantiate()
	get_tree().root.add_child(新场景)
	get_tree().current_scene = 新场景
	当前场景 = 新场景
	print("当前场景是%s" % 当前场景,"历史场景是",历史场景)
