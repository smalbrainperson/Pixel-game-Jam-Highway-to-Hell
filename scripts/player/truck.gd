extends VehicleBody3D

@export var fl_wheel: VehicleWheel3D
@export var fr_wheel: VehicleWheel3D
@export var bl_wheel: VehicleWheel3D
@export var br_wheel: VehicleWheel3D
@export var death: ColorRect
@export var max_rpm: float
@export var max_torque: float

func _process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("left", "right") * 0.24, 8.0 * delta)
	var accel: float = Input.get_axis("back", "forward") * 200.0
	var rpm: float
	rpm = ((fl_wheel.get_rpm() + br_wheel.get_rpm()) / 2) * (delta / 0.01666666667)
	fl_wheel.engine_force = (accel * max_torque * (1 - rpm / max_rpm))
	fr_wheel.engine_force = (accel * max_torque * (1 - rpm / max_rpm))
	bl_wheel.engine_force = (accel * max_torque * (1 - rpm / max_rpm))
	br_wheel.engine_force = (accel * max_torque * (1 - rpm / max_rpm))
	if global_position.z > 16834.0:
		death.color.a += 0.02
	if death.color.a >= 1.0:
		get_tree().change_scene_to_file("res://scenes/menu/Winner.tscn")
