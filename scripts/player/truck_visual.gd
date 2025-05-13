extends Node3D

@export var fl_wheel: MeshInstance3D
@export var fr_wheel: MeshInstance3D
@export var bl_wheel: MeshInstance3D
@export var br_wheel: MeshInstance3D

func _process(_delta: float) -> void:
	var main_truck = get_parent()
	fl_wheel.rotation.x = main_truck.fl_wheel.rotation.x
	fr_wheel.rotation.x = main_truck.fr_wheel.rotation.x
	bl_wheel.rotation.x = main_truck.bl_wheel.rotation.x
	br_wheel.rotation.x = main_truck.br_wheel.rotation.x
	fl_wheel.position.y = main_truck.fl_wheel.position.y
	fr_wheel.position.y = main_truck.fr_wheel.position.y
	bl_wheel.position.y = main_truck.bl_wheel.position.y
	br_wheel.position.y = main_truck.br_wheel.position.y
