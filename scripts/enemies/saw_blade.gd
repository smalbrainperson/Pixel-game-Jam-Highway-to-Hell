extends Node3D

@export var mesh: MeshInstance3D


func _process(delta: float) -> void:
	mesh.rotate_x(delta * -30)
	position.z -= 0.8 * delta / 0.0167

func _on_area_3d_area_entered(area: Area3D) -> void:
	if !area.get_parent().name == "truck": return
	area.get_parent().health -= 1
	area.get_parent().health_1.restart()
	area.get_parent().audio.hit()
	area.get_parent().score -= 100
	if area.get_parent().camera is Camera3D:
		area.get_parent().camera.camera_shake(0.2, 0.2)


func _on_timer_timeout() -> void:
	queue_free()
