extends Node

@onready var _controller := XRHelpers.get_xr_controller(self)
@export var ui: Node3D

var ui_layers : int

# Called when the node enters the scene tree for the first time.
func _ready():
	_controller.button_pressed.connect(_handle_button)


func _handle_button(button):
	if button == "ax_button":
		_toggle_ui()


func _toggle_ui():
	if ui.visible:
		ui.collision_layer = disable_bit(ui.collision_layer, 20)
		ui.hide()
	else:
		ui.collision_layer = enable_bit(ui.collision_layer, 20)
		ui.show()

func enable_bit(mask: int, index: int) -> int:
	return mask | (1 << index)

func disable_bit(mask: int, index: int) -> int:
	return mask & ~(1 << index)
