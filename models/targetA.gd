extends Node3D

@onready var timer: Timer = $Timer

var isReady: bool = true

signal bullet_hit()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_bullet_hit():
	if isReady:
		isReady = false
		Global.score += 1
		timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	isReady = true
