extends Node3D

var dash: bool

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.z += 15.0 * delta
	if dash:
		if get_parent().get_child(0).name == "truck":
			get_parent().get_child(0).linear_velocity.z += 24.0
		dash = false


func _on_area_3d_area_entered(area: Area3D) -> void:
	var truck: Node3D
	if area.get_parent().name != "truck": return
	truck = area.get_parent()
	truck.health -= 1
	truck.health_1.restart()
	truck.audio.hit()
	truck.camera.camera_shake(0.2, 0.2)
	dash = true
