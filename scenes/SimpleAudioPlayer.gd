class_name SimpleAudioPlayer
extends Node3D

var audio_fire_pistol = preload("res://sounds/laserSmall_000.ogg")
var audio_target_hit = preload("res://sounds/drop_002.ogg")
var audio_target_break = preload("res://sounds/footstep_grass_001.ogg")
var audio_grapple_hit_1 = preload("res://sounds/hook/impactMining_000.ogg")
var audio_grapple_hit_2 = preload("res://sounds/hook/impactMining_001.ogg")
var audio_grapple_hit_3 = preload("res://sounds/hook/impactMining_002.ogg")
var audio_grapple_hit_4 = preload("res://sounds/hook/impactMining_003.ogg")
var audio_grapple_hit_5 = preload("res://sounds/hook/impactMining_004.ogg")

var audio_node: AudioStreamPlayer = null

enum SoundName {
	FirePistol,
	TargetHit,
	TargetBreak,
	GrappleHit
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
	elif sound == SoundName.TargetBreak:
		audio_node.stream = audio_target_break
	elif sound == SoundName.GrappleHit:
		match (randi() % 4):
			0:
				audio_node.stream = audio_grapple_hit_1
			1:
				audio_node.stream = audio_grapple_hit_2
			2:
				audio_node.stream = audio_grapple_hit_3
			3:
				audio_node.stream = audio_grapple_hit_4
			4:
				audio_node.stream = audio_grapple_hit_5
	
	audio_node.play()


func destroy_self():
	audio_node.stop()
	queue_free()
