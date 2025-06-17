extends VehicleBody3D

@export var fl_wheel: VehicleWheel3D
@export var fr_wheel: VehicleWheel3D
@export var bl_wheel: VehicleWheel3D
@export var br_wheel: VehicleWheel3D
@export var death: ColorRect
@export var interact_area: Area3D
@export var camera: Camera3D
@export var max_rpm: float
@export var max_torque: float
@export var score_count: Label
@export var audio: Node
@export_group("Hearts")
@export var texture_rect: TextureRect
@export var texture_rect_2: TextureRect
@export var texture_rect_3: TextureRect
@export var texture_rect_4: TextureRect
@export var texture_rect_5: TextureRect
@export var half: TextureRect
@export var half_2: TextureRect
@export var half_3: TextureRect
@export var half_4: TextureRect
@export var half_5: TextureRect
@onready var health_1: GPUParticles2D = $health_1

var max_health: int = 3
var true_max_health: int = 5
var health: int = 3
var score: int

func _process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("left", "right") * 0.24, 8.0 * delta)
	var accel: float = Input.get_axis("back", "forward") * 200.0
	var rpm: float
	rpm = ((fl_wheel.get_rpm() + br_wheel.get_rpm()) / 2) * (delta / 0.01666666667)
	fl_wheel.engine_force = (accel * max_torque * (1 - rpm / max_rpm))
	fr_wheel.engine_force = (accel * max_torque * (1 - rpm / max_rpm))
	bl_wheel.engine_force = (accel * max_torque * (1 - rpm / max_rpm))
	br_wheel.engine_force = (accel * max_torque * (1 - rpm / max_rpm))
	var win: bool
	if global_position.z > 8192.0:
		win = true
		death.color.a += 0.02
	if death.color.a >= 1.0 and win:
		score += 10000
		OptionsVar.score = score
		get_tree().change_scene_to_file("res://scenes/menu/Winner.tscn")
	_health(delta)
	score_count.text = "SCORE:" + str(score)

func _health(delta: float) -> void:
	if max_health > 5:
		var dash: bool
		max_health = 5
		dash = true
		if dash:
			linear_velocity.z += 10.0
		dash = false
		if !dash:
			linear_velocity.z -= 8.0
		health = 5
	var dead: bool
	if health <= 0:
		death.color.a += 0.02 * delta/0.0167
		dead = true
		audio.dead = true
		OptionsVar.score = score
	if death.color.a >= 1.0 and dead:
		get_tree().change_scene_to_file("res://scenes/menu/death.tscn")
	if health > max_health:
		health = max_health
	_hearts()

func _hearts() -> void:
	if health <= 0:
		texture_rect.hide()
	if health > 1:
		texture_rect.show()
	else:
		texture_rect.hide()
	if health > 2:
		texture_rect_2.show()
	else:
		texture_rect_2.hide()
	if health > 3:
		texture_rect_3.show()
	else:
		texture_rect_4.hide()
	if health > 4:
		texture_rect_4.show()
	else:
		texture_rect_4.hide()
	if health > 5:
		texture_rect_5.show()
	else:
		texture_rect_5.hide()
	if max_health >= 1:
		half.show()
	else:
		half.hide()
	if max_health >= 2:
		half_2.show()
	else:
		half_2.hide()
	if max_health >= 3:
		half_3.show()
	else:
		half_3.hide()
	if max_health >= 4:
		half_4.show()
	else:
		half_4.hide()
	if max_health >= 5:
		half_5.show()
	else:
		half_5.hide()
