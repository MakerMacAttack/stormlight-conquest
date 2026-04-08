extends Control


#@onready var troop_display: TroopDisplay = $board/troopDisplay
#const PLAYER_SELECT = preload("res://Scenes/Player Select/playerSelect.tscn")


var playerColors: Array[PlayerColor]


func _ready() -> void:
	SignalHub.gameBegin.connect(onBegin)
	for newColor in Constants.DEFAULT_COLORS:
		if newColor.displayName != "Neutral":
			playerColors.append(PlayerColor.new(newColor))
	await get_tree().create_timer(0.5).timeout
	#var newPlayerSelect: PlayerSelect = PLAYER_SELECT.instantiate()
	#get_tree().root.add_child(newPlayerSelect)
	#newPlayerSelect.popup_centered()
	#troop_display.changeColor(Color.hex(0x50C878FF), Color.hex(0x000000FF))
	#troop_display.setTroopStrength("w", 89)

func onBegin(numberOfPlayers: int, playerDetails: Array) -> void:
	print(numberOfPlayers)
