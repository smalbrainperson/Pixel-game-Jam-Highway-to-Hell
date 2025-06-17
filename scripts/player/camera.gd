extends Camera3D

@export var h: Node3D
@export var v: Node3D
@export var mouse_sensitivty: float = 0.01
@onready var truck: VehicleBody3D = %truck

func camera_shake(period: float, magnitude: float) -> void:
	var initial_transform := self.transform 
	var elapsed_time := 0.0

	while elapsed_time < period:
		var offset := Vector3(
			randf_range(-magnitude, magnitude),
			randf_range(-magnitude, magnitude),
			0.0
		)

		self.transform.origin = initial_transform.origin + offset
		elapsed_time += get_process_delta_time()
		await get_tree().process_frame

	self.transform = initial_transform
# Called when the node enters the scene tree for the first time.
#func _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:
		#rotate_camera(event)

func _ready() -> void:
	v.rotation_degrees.x = 8.0

func _process(_delta: float) -> void:
	h.position = %truck.position + Vector3(0, 0.8, -0.5)

#func rotate_camera(event: InputEvent) -> void:
	#h.rotate(Vector3.UP, event.relative.x * mouse_sensitivty)
	#v.rotate(Vector3.RIGHT, event.relative.y * mouse_sensitivty)
	#v.rotation_degrees.x = clamp(v.rotation_degrees.x, -90.0, 90.0)
