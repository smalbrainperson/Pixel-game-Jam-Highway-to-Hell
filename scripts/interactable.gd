class_name interactable
extends Node3D



func _on_truck_area_entered(area: Area3D) -> void:
	var truck = area.get_parent()
