class_name Pistol
extends Node3D

@onready var _raycast : RayCast3D = $RayCast3D
var bullet_scene = preload("res://scenes/Bullet.tscn")

const raycast_length = 1000

func _ready():
	pass 

func fire_weapon():
	var clone = bullet_scene.instantiate()
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(clone)
	
	clone.global_transform = self.global_transform
	Global.create_sound(SimpleAudioPlayer.SoundName.FirePistol)
	
#	_raycast.target_position = Vector3(0, 0, raycast_length) * XRServer.world_scale
#	if _raycast.is_colliding():
#		var target = _raycast.get_collider()
#		if target.has_signal("bullet_hit"):
#			target.emit_signal("bullet_hit", _raycast.get_collision_point())
#		return target
#	return null
