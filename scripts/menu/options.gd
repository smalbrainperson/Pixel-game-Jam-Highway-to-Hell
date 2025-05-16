extends Node2D

@export var sfx_volume_slider: HSlider
@export var music_volume_slider: HSlider

var sfx_volume: float = 0.0
var music_volume: float = 0.0

func _ready() -> void:
	if sfx_volume_slider.value != null:
		sfx_volume_slider.value = OptionsVar.sfx_volume

func _process(delta: float) -> void:
	OptionsVar.sfx_volume = sfx_volume
	OptionsVar.music_volume = music_volume
	AudioServer.set_bus_volume_db(1, sfx_volume)
	AudioServer.set_bus_volume_db(2, music_volume)


func _on_button_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")



func _on_volume_drag_ended(value_changed: bool) -> void:
	sfx_volume = sfx_volume_slider.value

func _on_volume_2_drag_ended(value_changed: bool) -> void:
	music_volume = music_volume_slider.value
