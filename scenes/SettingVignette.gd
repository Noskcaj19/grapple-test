extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.vignette_updated.connect(_update_vignette)


func _update_vignette():
	$Vignette.visible = Global.vignette
	$Vignette.radius = Global.vignette_power / 10 + 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
