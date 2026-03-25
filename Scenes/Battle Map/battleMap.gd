extends Control


@onready var player_select: PopupMenu = $playerSelect


func _ready() -> void:
	player_select.visible = true
