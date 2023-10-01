extends Button


var is_open := false

func _ready():
	pressed.connect(_on_pressed)
	
func _on_pressed():
	EventBus.emit_signal("options_menu_accessed")
