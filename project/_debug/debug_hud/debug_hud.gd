extends Control


func _ready():
	hide()

func _input(_event):
	if Input.is_action_just_pressed("input_debug"):
		show()
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	if Input.is_action_just_released("input_debug"):
		hide()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
