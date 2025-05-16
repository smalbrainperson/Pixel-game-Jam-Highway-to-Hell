extends Node3D

@export var scene: PackedScene
@onready var truck: VehicleBody3D = %truck
var frames: float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	frames += randi_range(1, 3) * delta / 0.0167
	if truck.position.z > position.z:
		position.z = truck.position.z + randf_range(300.0, 800.0)
	if frames >= 177 and frames <= 183:
		_create_add_health()
		frames = 0

func _create_add_health():
	var node = scene.instantiate()
	node.position.x = randf_range(-12.0, 12.0)
	add_child(node)
