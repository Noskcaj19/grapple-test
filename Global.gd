extends Node

var _config = ConfigFile.new()

var simple_audio_player: PackedScene = preload("res://scenes/SimpleAudioPlayer.tscn")

var score = 0

func create_sound(sound: SimpleAudioPlayer.SoundName):
	var audio_clone = simple_audio_player.instantiate()
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(audio_clone)
	audio_clone.play_sound(sound)


enum WinchMode {
	Trigger, Thumbstick
}

var winch_mode: WinchMode = WinchMode.Trigger

func set_winch_mode(new_val: WinchMode):
	winch_mode = new_val
	_save()

func _ready():
	_load()

func _load():
	var err = _config.load("user://settings.cfg")
	if err != OK:
		return
	
	if _config.get_value("Input", "winch_mode") == "Trigger":
		winch_mode = WinchMode.Trigger
	else:
		winch_mode = WinchMode.Thumbstick

func _save():
	if winch_mode == WinchMode.Trigger:
		_config.set_value("Input", "winch_mode", "Trigger")
	else:
		_config.set_value("Input", "winch_mode", "Thumbstick")
	_config.save("user://settings.cfg")
