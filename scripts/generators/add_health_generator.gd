extends Node3D

@export var add_health_scene: PackedScene
@onready var truck: VehicleBody3D = %truck
var frames: float
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	frames += randi_range(1, 2) * delta / 0.0167
	if truck.position.z - 12.0 > position.z:
		position.z = truck.position.z + randf_range(50.0, 150.0)
	if frames >= 1197 and frames <= 1203:
		_create_add_health()
		frames = 0

func _create_add_health() -> void:
	var add_health_node := add_health_scene.instantiate()
	add_health_node.position.x = randf_range(-12.0, 12.0)
	add_child(add_health_node)
