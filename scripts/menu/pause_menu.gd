extends Control

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("menu"):
		get_tree().paused = !get_tree().paused
		visible = !visible


func _on_quit_button_up() -> void:
	get_tree().quit()


func _on_menu_button_up() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu/death.tscn")
