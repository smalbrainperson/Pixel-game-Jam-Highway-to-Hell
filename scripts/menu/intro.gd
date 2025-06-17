extends Node2D

@onready var label: Label = $Control/VBoxContainer/Label
@onready var label_2: Label = $Control/VBoxContainer/Label2
@onready var label_3: Label = $Control/VBoxContainer/Label3
@onready var label_4: Label = $Control/VBoxContainer/Label4
var visibles: int = 0

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("proceed"):
		visibles += 1
	if visibles >= 1:
		label.visible = true
	if visibles >= 2:
		label_2.visible = true
	if visibles >= 3:
		label_3.visible = true
	if visibles >= 4:
		label_4.visible = true
	if visibles >= 5:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
