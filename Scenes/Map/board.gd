extends Node2D


class_name Board


@onready var map: TextureRect = $map


func displayTroopStrength(region: Node) -> void:
	map.add_child(region)
