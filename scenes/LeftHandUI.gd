extends CanvasLayer

@export var GrappleWhichModeTrigger: CheckBox
@export var GrappleWhichModeThumbstick: CheckBox


func _ready():
	GrappleWhichModeTrigger.pressed.connect(self._update_which_mode)
	GrappleWhichModeThumbstick.pressed.connect(self._update_which_mode)
	%Vignette.pressed.connect(self._update_vignette)
	%"Vignette Power".value_changed.connect(self._update_vignette)
	_read_settings()

func _read_settings():
	if Global.winch_mode == Global.WinchMode.Thumbstick:
		GrappleWhichModeThumbstick.button_pressed = true
	else:
		GrappleWhichModeTrigger.button_pressed = true
	
	%Vignette.button_pressed = Global.vignette
	%"Vignette Power".value = Global.vignette_power

func _update_which_mode():
	if GrappleWhichModeThumbstick.button_pressed:
		Global.set_winch_mode(Global.WinchMode.Thumbstick)
	else:
		Global.set_winch_mode(Global.WinchMode.Trigger)

func _update_vignette():
	Global.set_vignette_enabled(%Vignette.button_pressed)
	Global.set_vignette_power(%"Vignette Power".value)

func _process(delta):
	$ColorRect/VBoxContainer/Score.text = "Targets Hit: " + str(Global.score)

func _on_reset_score_pressed():
	Global.score = 0
