extends Node

@onready var hit_sfx: AudioStreamPlayer = $hit
@onready var power_up_sfx: AudioStreamPlayer = $power_up
@onready var music: AudioStreamPlayer = $music
var dead: bool = false

func hit() -> void:
	hit_sfx.play()
func power_up() -> void:
	power_up_sfx.play()

func _process(delta: float) -> void:
	hit_sfx.pitch_scale = randf_range(0.9, 1.1)
	power_up_sfx.pitch_scale = randf_range(1.27, 1.36)
	if dead: music.volume_db -= 0.2 * delta/0.0167
