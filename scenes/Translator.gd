extends Node3D

@export var speed = 1
@export var vector = Vector3(1, 0 ,0)

var x = 0

func _physics_process(delta):
	%Translator.position = vector * sin(x)
	x += speed * delta
