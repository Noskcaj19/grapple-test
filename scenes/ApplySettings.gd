extends Node


func _ready():
	Global.turn_updated.connect(_update_turn)
	Global.style_updated.connect(_update_style)
	_update_turn()

func _update_turn():
	%MovementTurn.enabled = Global.turn

func _update_style():
	var env: WorldEnvironment = %WorldEnvironment
	var mat: ProceduralSkyMaterial = env.environment.sky.sky_material
	if Global.style:
		mat.sky_top_color = Color(0.764706, 0, 0, 1)
		mat.sky_horizon_color = Color(0.647059, 0.552941, 0.670588, 1)
		mat.ground_bottom_color = Color(0, 0.713726, 0.721569, 1)
	else:
		mat.sky_top_color = Color(0.38, 0.45, 0.55, 1)
		mat.sky_horizon_color = Color(0.64, 0.65, 0.67, 1)
		mat.ground_bottom_color = Color(0.20, 0.65, 0.67, 1)
