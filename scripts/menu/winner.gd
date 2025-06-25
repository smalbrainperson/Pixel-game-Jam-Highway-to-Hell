extends Node2D

@onready var label: Label = $"text 1/VBoxContainer/Label"
@onready var label_2: Label = $"text 1/VBoxContainer/Label2"
@onready var label_3: Label = $"text 1/VBoxContainer/Label3"
@onready var label_4: Label = $"text 1/VBoxContainer/Label4"
@onready var label_5: Label = $"text 1/VBoxContainer/Label5"
@onready var button: Button = $"text 1/VBoxContainer/Button"
@onready var button_2: Button = $"text 1/VBoxContainer/Button2"

var visibles: int = 1

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	label_5.text = "SCORE: " + str(OptionsVar.score)
	$AnimationPlayer.play("load", -1.0, 0.3)
	

func _process(_delta: float) -> void:
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
		label_5.visible = true
	if visibles >= 6:
		button.visible = true
	if visibles >= 7:
		button_2.visible = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _animation_finished() -> void:
	$"text 1".visible = true

func _on_button_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_button_2_button_up() -> void:
	get_tree().quit()
