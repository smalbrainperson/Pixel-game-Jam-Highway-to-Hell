extends Node3D

@onready var visuals: Node3D = $visuals

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visuals.rotate_y(-delta * 2.0)


func _on_area_3d_area_entered(area: Area3D) -> void:
	var truck = area.get_parent()
	truck.max_health += 1
	truck.score += 300
	queue_free()
