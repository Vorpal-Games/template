extends Button


func _pressed():
	EventBus.emit_signal("ui_return_requested")
