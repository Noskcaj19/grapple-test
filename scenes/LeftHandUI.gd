extends CanvasLayer

@export var GrappleWhichModeTrigger: CheckBox
@export var GrappleWhichModeThumbstick: CheckBox


func _ready():
	GrappleWhichModeTrigger.pressed.connect(self._update_which_mode)
	GrappleWhichModeThumbstick.pressed.connect(self._update_which_mode)
	_read_settings()

func _read_settings():
	if Global.winch_mode == Global.WinchMode.Thumbstick:
		GrappleWhichModeThumbstick.button_pressed = true
	else:
		GrappleWhichModeTrigger.button_pressed = true

func _update_which_mode():
	if GrappleWhichModeThumbstick.button_pressed:
		Global.set_winch_mode(Global.WinchMode.Thumbstick)
	else:
		Global.set_winch_mode(Global.WinchMode.Trigger)

func _process(delta):
	$ColorRect/VBoxContainer/Score.text = "Targets Hit: " + str(Global.score)

func _on_reset_score_pressed():
	Global.score = 0
