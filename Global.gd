extends Node

signal vignette_updated()
signal turn_updated()

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
var vignette = false
var vignette_power = 1
var turn = true


func set_turn_enabled(new_val: bool):
	turn = new_val
	turn_updated.emit()
	_save()

func set_winch_mode(new_val: WinchMode):
	winch_mode = new_val
	_save()

func set_vignette_power(new_val: float):
	vignette_power = new_val
	_update_vignette()
	_save()

func set_vignette_enabled(new_val: bool):
	vignette = new_val
	_update_vignette()
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
	

	if _config.get_value("Input", "turn") != null:
		turn = _config.get_value("Input", "turn")
	
	if _config.get_value("Accessibility", "vignette") != null:
		vignette = _config.get_value("Accessibility", "vignette")

	if _config.get_value("Accessibility", "vignette_power") != null:
		vignette_power = _config.get_value("Accessibility", "vignette_power")

func _save():
	if winch_mode == WinchMode.Trigger:
		_config.set_value("Input", "winch_mode", "Trigger")
	else:
		_config.set_value("Input", "winch_mode", "Thumbstick")
	_config.set_value("Input", "turn", turn)
	_config.set_value("Accessibility", "vignette_power", vignette_power)
	_config.set_value("Accessibility", "vignette", vignette)
	_config.save("user://settings.cfg")

func _update_vignette():
	vignette_updated.emit()
