class_name Pistol
extends Node3D

@onready var _raycast : RayCast3D = $RayCast3D

const raycast_length = 1000

func _ready():
	pass 

func fire_weapon() -> Node3D:
	_raycast.target_position = Vector3(0, 0, raycast_length) * XRServer.world_scale
	if _raycast.is_colliding():
		var target = _raycast.get_collider()
		if target.has_signal("bullet_hit"):
			target.emit_signal("bullet_hit", _raycast.get_collision_point())
		return target
	return null
