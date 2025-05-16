extends Node3D

@export var visuals: Node3D

func _process(delta: float) -> void:
	visuals.rotate_y(-delta * 2.0)


func _on_area_3d_area_entered(area: Area3D) -> void:
	var truck: Node
	if area.get_parent().name == "truck":
		truck = area.get_parent()
	
	truck.health += 1
	truck.score += 200
	queue_free()
