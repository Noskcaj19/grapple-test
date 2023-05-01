extends Node3D

@export var weapon: Pistol

@export var fire_button_action : String = "ax_button"

# Node references
@onready var _controller := XRHelpers.get_right_controller(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(delta):
	process_input(delta)

func process_input(_delta):
	process_weapon()

var fired = false
func process_weapon():
	if _controller.is_button_pressed(fire_button_action):
		if fired: return
#		create_sound(SimpleAudioPlayer.SoundName.FirePistol)
		fired = true
		if weapon.fire_weapon():
			Global.create_sound(SimpleAudioPlayer.SoundName.TargetHit)
	else:
		fired = false
