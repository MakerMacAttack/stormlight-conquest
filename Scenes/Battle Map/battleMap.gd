extends Control


@onready var player_select: PopupMenu = $playerSelect


var playerColors: Array[PlayerColor]


func _ready() -> void:
	for newColor in Constants.DEFAULT_COLORS:
		if newColor.displayName != "Neutral":
			playerColors.append(PlayerColor.new(newColor))
	player_select.visible = true
