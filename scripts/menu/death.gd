extends Node2D

@onready var label: Label = $Control/VBoxContainer/Label
@onready var label_2: Label = $Control/VBoxContainer/Label2
@onready var label_3: Label = $Control/VBoxContainer/Label3
@onready var label_4: Label = $Control/VBoxContainer/Label4
@onready var button: Button = $Control/VBoxContainer/Button
var shown: int = 0
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	label_4.text = "SCORE: " + str(OptionsVar.score)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("proceed"):
		shown += 1
	if shown >= 1: label.show()
	if shown >= 2: label_2.show()
	if shown >= 3: label_3.show()
	if shown >= 4: label_4.show()
	if shown >= 5: button.show()
	

func _menu() -> void:
	OptionsVar.score = 0
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")
