extends Node2D


func _on_play_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/intro.tscn")


func _on_options_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/options.tscn")


func _on_quit_button_up() -> void:
	get_tree().quit()
