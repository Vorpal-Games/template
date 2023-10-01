extends Menu


var is_paused = false


func _ready():
	hide()

func _input(_event):
	if Input.is_action_just_pressed("input_pause"):
		is_paused = not is_paused
		
		EventBus.emit_signal(
			"pause_menu_accessed" if is_paused else "pause_menu_retired"
		)
		
		if is_paused:
			get_tree().paused = true
			Input.mouse_mode = Input.MOUSE_MODE_CONFINED
		else:
			get_tree().paused = false
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		

