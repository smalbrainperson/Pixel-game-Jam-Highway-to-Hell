extends Node3D

@export var mesh: MeshInstance3D

func _process(delta: float) -> void:
	mesh.rotate_x(delta * -30)
	position.z -= 0.8 * delta / 0.0167

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.get_parent().name == "truck":
		area.get_parent().health -= 1
		queue_free()
