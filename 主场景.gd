extends Node3D

@onready var 玩家: CharacterBody3D = $玩家

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	print(delta)
