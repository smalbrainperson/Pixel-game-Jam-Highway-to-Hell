extends Node3D

# Road settings
@export var segmentLength := 2.0 # Segment lenght
@export var roadMaterial := preload("res://shaders/materials/road.tres") # Road material
@export var numSegments := 100 # Startup segments count
@export var mesh: Mesh

var segments: Array = [] # Segments list (array)

func _ready() -> void:
	# Generate startup segments
	for i in range(numSegments):
		generateSegment()

func generateSegment() -> void:
	var segment := MeshInstance3D.new()
	segment.mesh = mesh
	segment.create_convex_collision()

	segment.transform = Transform3D(Basis(), Vector3(0, 0, segments.size() * segmentLength))

	if roadMaterial:
		segment.material_override = roadMaterial
	
	add_child(segment)
	segments.append(segment)

func _process(_delta: float) -> void:
	var player := %truck
	var playerPos: float = player.global_transform.origin.z / 0.5
	var lastSegmentPos: float = segments[segments.size() - 1].global_transform.origin.z
	var firstSegmentPos: float = segments[0].global_transform.origin.z
	if playerPos > lastSegmentPos - segmentLength * 3.0:
		generateSegment()
	if playerPos - segmentLength * 3.0 > firstSegmentPos * 3.0:
		segments.remove_at(0)
		get_child(0).queue_free()
