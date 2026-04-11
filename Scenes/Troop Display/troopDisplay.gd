extends ColorRect


class_name TroopDisplay


@onready var troop_strength: Label = $fill/troopStrength


#func _ready() -> void:
	#changeColor(Color.hex(0xE0115FFF), Color.hex(0x000000FF))

func changeColor(newColor: Color, newStroke: Color) -> void:
	troop_strength.label_settings.font_color = newColor
	troop_strength.label_settings.outline_color = newStroke

func setTroopStrength(playerDesignation: String, troopStrength: int) -> void:
	troop_strength.text = "%s%d" % [playerDesignation, troopStrength]
