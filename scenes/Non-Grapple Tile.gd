@tool
extends StaticBody3D

@export var tileScale : Vector3 = Vector3(1,1,1):
	set = _set_tile_scale

# Get Mesh
@onready var mesh : MeshInstance3D = $MeshInstance3D

# Get Collider
@onready var collider : CollisionShape3D = $CollisionShape3D

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_inside_tree() and mesh and collider:
		# Copy & Update Mesh
		var newMesh = mesh.mesh.duplicate()
		newMesh.size = tileScale
		mesh.mesh = newMesh
		# Copy & Update Collider
		var newShape = collider.shape.duplicate()
		newShape.size = tileScale
		collider.shape = newShape

# Called when the tile scale has been modified
func _set_tile_scale(new_value: Vector3) -> void:
	tileScale = new_value
	if is_inside_tree() and mesh and collider:
		# Copy & Update Mesh
		var newMesh = mesh.mesh.duplicate()
		newMesh.size = new_value
		mesh.mesh = newMesh
		# Copy & Update Collider
		var newShape = collider.shape.duplicate()
		newShape.size = new_value
		collider.shape = newShape
