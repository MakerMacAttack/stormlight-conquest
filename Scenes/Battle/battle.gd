extends Control


@onready var player_select: PlayerSelect = $playerSelect
@onready var board: Board = $hBoxContainer/board


const TROOP_DISPLAY = preload("res://Scenes/Troop Display/troopDisplay.tscn")


var playerColors: Array[PlayerColor]
var game: Game


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
	player_select.queue_free()
	# instantiate a game with the number of players and details
	game = Game.new(numberOfPlayers, playerDetails)
	# set the region displays
	for region in game.regions:
		var createTroopDisplay: TroopDisplay = TROOP_DISPLAY.instantiate()
		createTroopDisplay.set_position(region.spawnPoint)
		board.displayTroopStrength(createTroopDisplay)
		createTroopDisplay.setTroopStrength(region.currentOwner.colorTheme.accessibilityCode, 3)
		var newSettings = LabelSettings.new()
		newSettings.font_color = region.currentOwner.colorTheme.hex
		newSettings.outline_color = region.currentOwner.colorTheme.stroke
		createTroopDisplay.changeColor(newSettings)
	# generate the various troop strength displays
	# figure out turn order
	# figure out the code to make the game proceed through the actions of a turn.
