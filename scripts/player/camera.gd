extends Camera3D

@export var h: Node3D
@export var v: Node3D
@export var mouse_sensitivty: float = 0.01

# Called when the node enters the scene tree for the first time.
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_camera(event)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func rotate_camera(event):
	h.rotate(Vector3.UP, event.relative.x * mouse_sensitivty)
	v.rotate(Vector3.RIGHT, event.relative.y * mouse_sensitivty)
	v.rotation_degrees.x = clamp(v.rotation_degrees.x, -90.0, 90.0)
