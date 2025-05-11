extends VehicleBody3D

@export var fl_wheel: VehicleWheel3D
@export var fr_wheel: VehicleWheel3D
@export var bl_wheel: VehicleWheel3D
@export var br_wheel: VehicleWheel3D
@export var max_rpm: float
@export var max_torque: float

func _process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("left", "right") * 0.2, 8.0 * delta)
	var accel: float = Input.get_axis("back", "forward") * 200.0
	var rpm: float
	rpm = (fl_wheel.get_rpm() + br_wheel.get_rpm()) / 2
	fl_wheel.engine_force = accel * max_torque * (1 - rpm / max_rpm)
	fr_wheel.engine_force = accel * max_torque * (1 - rpm / max_rpm)
	bl_wheel.engine_force = accel * max_torque * (1 - rpm / max_rpm)
	br_wheel.engine_force = accel * max_torque * (1 - rpm / max_rpm)
