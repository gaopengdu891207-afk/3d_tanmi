extends Control


func _on_继续游戏_pressed() -> void:
	游戏管理器.恢复游戏()
func _on_返回主菜单_pressed() -> void:
	游戏管理器.返回主菜单()
func _on_退出游戏_pressed() -> void: 
	游戏管理器.退出游戏()
