extends Node2D


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("proceed"):
		get_tree().change_scene_to_file("res://scenes/main.tscn")
