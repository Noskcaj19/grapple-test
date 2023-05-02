extends Node3D

@export var score: int = 1

# Get timer
@onready var timer: Timer = $Timer

# Get collider
@onready var collider: CollisionShape3D = $CollisionShape3D

var isReady: bool = true

signal bullet_hit()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_bullet_hit():
	if isReady:
		self.visible = false
		isReady = false
		Global.score += score
		Global.create_sound(SimpleAudioPlayer.SoundName.TargetBreak)
		timer.start()

func _on_timer_timeout():
	self.visible = true
	isReady = true
