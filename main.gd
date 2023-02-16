extends Node3D

var interface : XRInterface

# Called when the node enters the scene tree for the first time.
func _ready():
	interface = XRServer.find_interface("OpenXR")
	if interface and interface.is_initialized():
		print("OpenXR initialised successfully")
		
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, check headset connection")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
