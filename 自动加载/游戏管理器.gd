extends Node


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("切换场景"):
		if 状态管理器.当前状态 == 状态管理器.游戏状态.暂停:
			恢复游戏()
		elif 状态管理器.当前状态 == 状态管理器.游戏状态.游戏中:
			暂停游戏()
		get_viewport().set_input_as_handled()
		
func 初始化标题():
	UI管理器.打开系统层控件("主菜单")
	UI管理器.hud层.visible = false
	状态管理器.切换状态(状态管理器.游戏状态.菜单)
	
func 开始游戏():
	UI管理器.关闭系统层控件(" 主菜单")
	场景管理器.切换场景("res://场景/启动/主场景.tscn")
	UI管理器.hud层.visible = true
	状态管理器.切换状态(状态管理器.游戏状态.游戏中)

func 返回主菜单():
	UI管理器.打开系统层控件("主菜单")
	场景管理器.切换场景("res://场景/Main.tscn")
	UI管理器.hud层.visible = false
	状态管理器.切换状态(状态管理器.游戏状态.菜单)
	
func 暂停游戏():
	状态管理器.切换状态(状态管理器.游戏状态.暂停)
	UI管理器.打开系统层控件("暂停菜单")
	UI管理器.hud层.visible = true
	
func 恢复游戏():
	状态管理器.切换状态(状态管理器.游戏状态.游戏中)
	UI管理器.关闭系统层控件("暂停菜单")
	UI管理器.hud层.visible = true
	
func 退出游戏():
	get_tree().quit()
