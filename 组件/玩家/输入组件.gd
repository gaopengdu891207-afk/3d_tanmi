class_name 输入组件
extends 组件基类

signal 移动(输入向量: Vector2)
signal 跳跃
signal 鼠标偏移(偏移量: Vector2)


func _physics_process(delta: float) -> void:
	if not 是否启用:
		return
	if Input.is_action_just_pressed("跳跃"):
		跳跃.emit()
	var input_dir := Input.get_vector("向左", "向右", "向前", "向后")
	移动.emit(input_dir)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and not (event.relative as Vector2).is_zero_approx():
		var offset:Vector2 = event.relative
		鼠标偏移.emit(offset)
