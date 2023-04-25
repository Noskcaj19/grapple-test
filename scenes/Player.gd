extends Node3D

@export var weapon: Pistol

@export var fire_button_action : String = "ax_button"

# Node references
@onready var _controller := XRHelpers.get_right_controller(self)

var simple_audio_player: PackedScene = preload("res://scenes/SimpleAudioPlayer.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func create_sound(sound: SimpleAudioPlayer.SoundName):
	var audio_clone = simple_audio_player.instantiate()
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(audio_clone)
	audio_clone.play_sound(sound)

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
			create_sound(SimpleAudioPlayer.SoundName.TargetHit)
	else:
		fired = false
