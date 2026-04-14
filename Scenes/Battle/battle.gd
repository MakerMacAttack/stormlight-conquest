extends Control


@onready var player_select: PlayerSelect = $playerSelect
#@onready var board: Board = $hBoxContainer/board
#@onready var board: Board = $hBoxContainer/subViewportContainer/subViewport/board
@onready var board: Board = $hBoxContainer/mapCards/subViewportContainer/subViewport/board
@onready var actions_help: VBoxContainer = $hBoxContainer/actionsHelp


const TROOP_DISPLAY = preload("res://Scenes/Troop Display/troopDisplay.tscn")
const REINFORCEMENT = preload("res://Scenes/Reinforcement/reinforcement.tscn")


var playerColors: Array[PlayerColor]
var game: Game
#default zoom is set to 0.9 in the map because of scaling on the board
var defaultZoom: float = 0.9
var maxZoom: float = 3.0
var zoom: float = defaultZoom
#new variable to prevent over zooming adjustments
var prevZoom: float = zoom 
var zoom_speed: float = 0.1
var scrollSpeed: float = 10
var maxValueX: int = -775
var maxValueY: int = -580
var zoomScaling: float = 1.09

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
		newSettings.outline_size = 5
		createTroopDisplay.changeColor(newSettings)
	# basically everything below this should prolly be abstracted to a separate function.
	var attachReinforcement: Reinforcement = REINFORCEMENT.instantiate()
	attachReinforcement.custom_minimum_size = Vector2(0,400)
	actions_help.add_child(attachReinforcement)
	var currentPlayerRegions = game.regions.filter(filterRegions)
	attachReinforcement.territories = currentPlayerRegions
	attachReinforcement.bonus = 3
	# generate the various troop strength displays
	# figure out turn order
	# figure out the code to make the game proceed through the actions of a turn.

#new function to pan and zoom map
func _unhandled_input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			zoom = clamp(zoom + zoom_speed, defaultZoom, maxZoom)
			print("zoom: ",zoom)
			#zooming in on map will adjust pan so that the focus stays centered (more or less) by adjusting x and y position when the zoom changes
			if zoom != prevZoom: board.position.x = clamp(board.position.x*(zoomScaling), maxValueX*(zoom-defaultZoom)/defaultZoom, 0)
			print("x: ",board.position.x)
			if zoom != prevZoom: board.position.y = clamp(board.position.y*(zoomScaling), maxValueY*(zoom-defaultZoom)/defaultZoom, 0)
			print("y: ",board.position.y)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			zoom = clamp(zoom - zoom_speed, defaultZoom, maxZoom)
			print("zoom: ",zoom)
			board.position.x = clamp(board.position.x*(1/zoomScaling), maxValueX*(zoom-defaultZoom)/defaultZoom, 0)
			print("x: ",board.position.x)
			board.position.y = clamp(board.position.y*(1/zoomScaling), maxValueY*(zoom-defaultZoom)/defaultZoom, 0)
			print("y: ",board.position.y)
		prevZoom = zoom
		board.scale = Vector2(zoom, zoom)

	#zooming in on map will adjust maximum x and y positions and increase scroll speed
	if event.is_action_pressed("ui_left"):
		board.position.x = clamp(board.position.x + scrollSpeed*zoom, maxValueX*(zoom-defaultZoom)/defaultZoom, 0)
		print(board.position.x)
	if event.is_action_pressed("ui_right"):
		board.position.x = clamp(board.position.x - scrollSpeed*zoom, maxValueX*(zoom-defaultZoom)/defaultZoom, 0)
		print(board.position.x)
	if event.is_action_pressed("ui_up"):
		board.position.y = clamp(board.position.y + scrollSpeed*zoom, maxValueY*(zoom-defaultZoom)/defaultZoom, 0)
		print(board.position.y)
	if event.is_action_pressed("ui_down"):
		board.position.y = clamp(board.position.y - scrollSpeed*zoom, maxValueY*(zoom-defaultZoom)/defaultZoom, 0)
		print(board.position.y)

func filterRegions(checkRegion: Region) -> bool:
	return checkRegion.currentOwner == game.currentPlayer
