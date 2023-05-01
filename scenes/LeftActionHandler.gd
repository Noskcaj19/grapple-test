extends Node

@onready var _controller := XRHelpers.get_xr_controller(self)
@export var ui: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	_controller.button_pressed.connect(_handle_button)


func _handle_button(button):
	if button == "ax_button":
		_toggle_ui()


func _toggle_ui():
	if ui.visible:
		ui.hide()
	else:
		ui.show()
