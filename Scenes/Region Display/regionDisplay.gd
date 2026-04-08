extends Node2D


class_name RegionDisplay


@onready var troop_strength: Label = $border/fill/troopStrength


func _ready() -> void:
	var newColor = Color.hex(0x0F52BAFF)
	troop_strength.add_theme_color_override("red", newColor)
