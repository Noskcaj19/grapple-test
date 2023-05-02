extends Node3D

var BULLET_SPEED = 150

var timer = 0

var hit_something = false
var KILL_TIMER = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area3D.connect("body_entered", _collided)

func _collided(body):
	if hit_something == false:
		if body.has_signal("bullet_hit"):
			body.emit_signal("bullet_hit")
		Global.create_sound(SimpleAudioPlayer.SoundName.TargetHit)
	hit_something = true
	queue_free()
	
func _process(delta):
	pass

func _physics_process(delta):

	var forward_dir = -global_transform.basis.z.normalized()
	global_translate(forward_dir * BULLET_SPEED * delta)
	
	timer += delta
	if timer >= KILL_TIMER:
		queue_free()
