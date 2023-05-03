extends Node3D

@onready var character: CharacterBody3D = get_parent()
@export var limit = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	print(character)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if character.velocity.length() > limit:
		character.velocity = _clamp_norm(character.velocity, limit)
		print(character.velocity)

func _clamp_norm(v: Vector3, n_max: float):
	var n = sqrt(v.x ** 2 + v.y ** 2 + v.z ** 2)
	var f = min(n, n_max) / n
	return Vector3(f * v.x, f * v.y, f * v.z)
