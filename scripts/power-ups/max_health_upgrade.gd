extends Node3D

@onready var visuals: Node3D = $visuals

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visuals.rotate_y(-delta * 2.0)


func _on_area_3d_area_entered(area: Area3D) -> void:
	var truck: VehicleBody3D
	if area.get_parent().name != "truck": return
	truck = area.get_parent()
	truck.audio.power_up()
	truck.max_health += 1
	truck.score += 300
	truck.camera.camera_shake(0.15, 0.03)
	queue_free()
