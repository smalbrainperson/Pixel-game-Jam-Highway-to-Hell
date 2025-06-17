extends Node3D

@onready var visuals: Node3D = $spikey_boy
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visuals.rotate_z(delta * 8.0)
	position.x -= 0.5 * delta/0.016667
	if position.x < -32.0: queue_free()

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.get_parent().name != "truck": return
	var truck := area.get_parent()
	truck.health -= 1
	truck.health_1.restart()
	truck.audio.hit()
	truck.camera.camera_shake(0.2, 0.2)
