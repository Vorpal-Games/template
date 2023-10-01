extends Control


class_name Menu


func _ready():
	hide()

# Toggles whether or not this menu is hidden
func toggle_hidden():
	if visible:
		
		hide()
	else:
		print("showing")
		show()

func access():
	if not visible: show()

func retire():
	if visible: hide()
