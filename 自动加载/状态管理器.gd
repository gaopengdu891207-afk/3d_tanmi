extends Node

enum 游戏状态{启动, 菜单, 加载, 游戏中, 暂停, 结束}

var 当前状态:游戏状态 = 游戏状态.启动


func _ready() -> void:
	当前状态 = 游戏状态.菜单

func 切换状态(目标状态:游戏状态):
	if 当前状态 == 目标状态: return
	当前状态 = 目标状态
	
	match 当前状态:
		游戏状态.启动:
			启动状态处理()
		游戏状态.菜单:
			菜单状态处理()
		游戏状态.加载:
			加载状态处理()
		游戏状态.游戏中:
			游戏中状态处理()
		游戏状态.暂停:
			暂停状态处理()
		游戏状态.结束:
			结束状态处理()

func 启动状态处理():
	pass
func 菜单状态处理():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
func 加载状态处理():
	pass
func 游戏中状态处理():
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
func 暂停状态处理():
	get_tree().paused =true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
func 结束状态处理():
	pass
