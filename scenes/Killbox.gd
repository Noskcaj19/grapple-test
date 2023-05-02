extends Area3D

func _on_body_exited(_body):
	get_tree().reload_current_scene()
