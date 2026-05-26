extends Control

@onready var hud层: CanvasLayer = $HUD层
@onready var 功能层: CanvasLayer = $功能层
@onready var 系统层: CanvasLayer = $系统层
@onready var 弹出层: CanvasLayer = $弹出层

@onready var 准心: ColorRect = $HUD层/准心
@onready var 主菜单: Control = $系统层/主菜单

@onready var ui实例池:Dictionary[String, Control] = {
	"准心":准心,
	"主菜单":主菜单,
}


func _ready() -> void:
	初始化UI层()

func 初始化UI层():
	hud层.visible = false
	功能层.visible = false
	系统层.visible = true
	弹出层.visible = false

func 打开系统层控件(控件名称:String):
	for 子控件 in 系统层.get_children():
		子控件.visible = false
	ui实例池[控件名称].visible = true
	
	hud层.visible = false
	功能层.visible = false
	系统层.visible = true
	弹出层.visible = false
	
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func 关闭系统层控件(控件名称:String):
	ui实例池[控件名称].visible = false
	系统层.visible = false
	hud层.visible = true
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
