class_name SimpleAudioPlayer
extends Node3D

var audio_fire_pistol = preload("res://sounds/laserSmall_000.ogg")
var audio_target_hit = preload("res://sounds/drop_002.ogg")

var audio_node: AudioStreamPlayer = null

enum SoundName {
	FirePistol,
	TargetHit,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	audio_node = $AudioStreamPlayer
	audio_node.connect("finished", destroy_self)
	audio_node.stop()


func play_sound(sound: SoundName):
	if sound == SoundName.FirePistol:
		audio_node.stream = audio_fire_pistol
	elif sound == SoundName.TargetHit:
		audio_node.stream = audio_target_hit

	audio_node.play()


func destroy_self():
	audio_node.stop()
	queue_free()
