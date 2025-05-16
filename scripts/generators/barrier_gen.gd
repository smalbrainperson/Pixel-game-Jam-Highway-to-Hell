extends Node3D

# Road settings
@export var segmentLength = 2.0 # Segment lenght
@export var roadMaterial = preload("res://shaders/materials/road.tres") # Road material
@export var numSegments = 100 # Startup segments count
@export var mesh: Mesh

var segments = [] # Segments list (array)

func _ready():
	# Generate startup segments
	for i in range(numSegments):
		generateSegment()

func generateSegment():
	var segment = MeshInstance3D.new()
	segment.mesh = mesh
	segment.create_trimesh_collision()

	segment.transform = Transform3D(Basis(), Vector3(0, 0, segments.size() * segmentLength))

	if roadMaterial:
		segment.material_override = roadMaterial
	
	add_child(segment)
	segments.append(segment)

func _process(_delta):
	var player = %truck
	var playerPos = player.global_transform.origin.z / 0.5
	var lastSegmentPos = segments[segments.size() - 1].global_transform.origin.z
	if playerPos > lastSegmentPos - segmentLength * 3.0:
		generateSegment()
