extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.turn_updated.connect(_update_turn)
	_update_turn()

func _update_turn():
#	var parent= get_parent()
#	print(parent)
#	var children = parent.find_children("MovementTurn", "", true)
#	print(children)
	%MovementTurn.enabled = Global.turn

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
