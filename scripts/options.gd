extends Node2D

@onready var volume_slider: HSlider = $ui/Label/volume

var volume: float

func _ready() -> void:
	volume_slider.value = volume

func _process(delta: float) -> void:
	print(volume)
	AudioServer.set_bus_volume_db(0, volume)


func _on_button_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")


func _on_volume_drag_ended(value_changed: bool) -> void:
	volume = volume_slider.value
