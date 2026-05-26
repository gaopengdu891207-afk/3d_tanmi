extends Control


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE 

func _on_开始游戏_pressed() -> void:
	var ui_manager = get_node("/root/UI管理器")
	if ui_manager:
		ui_manager.关闭系统层控件("主菜单")
	var scene_manager = get_node("/root/场景管理器")
	if scene_manager:
		scene_manager.切换场景("res://场景/启动/主场景.tscn")

func _on_退出游戏_pressed() -> void:
	get_tree().quit()
