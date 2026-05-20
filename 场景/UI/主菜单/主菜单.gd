extends Control


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE 

func _on_退出游戏_pressed() -> void:
	get_tree().quit()


func _on_开始游戏_pressed() -> void:
	场景管理器.切换场景("res://场景/启动/主场景.tscn")
