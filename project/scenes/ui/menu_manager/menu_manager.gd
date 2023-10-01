extends Node


var menus := []
var active_menu: Menu
var nav_history = []


# Since we still need access to menu-specific info outside of the iterator in our
# ready function, we have to create a sort of "hook" here where the iterator function
# can create a little lambda with the menu-specific info needed (target_menu) packed
# inside in a closure. So that's why we're doing this weird lambda return thing
func generate_on_nav_enter(target_menu: Menu):
	return func _on_nav_enter():
		# Disable the preceding menu if there is one
		if active_menu: active_menu.retire()
		
		nav_history.push_back(target_menu.name.to_snake_case())
		
		target_menu.access()
		active_menu = target_menu

# Refer to comment above
func generate_on_nav_leave(target_menu: Menu):
	return func _on_nav_leave():
		nav_history.pop_back()

		target_menu.retire()


func _ready():
	# Filter out any non-menu children
	for child in get_children():
		if child is Menu: menus.push_front(child)

	for menu in menus:
		var access_signal = "{0}_accessed".format([menu.name.to_snake_case()], "{_}")
		var retire_signal = "{0}_retired".format([menu.name.to_snake_case()], "{_}")

		# I have the slightest mixed feelings about implementing this this way,
		# simply because these are now essentially just undocumented signals
		# attached to EventBus, meaning EventBus isn't its only source of truth, but...
		
		# I really don't want to type out an access and retire signal + documentation for
		# every button in the game, so hope this at least is a neat piece of code lol
		EventBus.add_user_signal(access_signal, [
			{ "name": "target_menu", "type": "Menu" }
		])
		EventBus.add_user_signal(retire_signal, [
			{ "name": "target_menu", "type": "Menu" }
		])
		
		EventBus.connect(access_signal, generate_on_nav_enter(menu))
		EventBus.connect(retire_signal, generate_on_nav_leave(menu))
	
	EventBus.connect("ui_return_requested", _on_ui_return_requested)
		

# Keep an eye on this _on_ui_return_requested guy. He gets funky sometimes I think
func _on_ui_return_requested():
	var prev_menu_name: String = nav_history[nav_history.size() - 2]
	
	active_menu.retire()
	nav_history.pop_back()
	EventBus.emit_signal(prev_menu_name + "_accessed")
