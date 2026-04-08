extends Control


class_name NewPlayerDetails


@onready var colorSelect: OptionButton = $colorSelect
@onready var player_name: LineEdit = $playerName


var playerNumber: int
var playerName: String
var playerColor: int


signal newPlayerUpdate


func addColorTexture(color: Color) -> ImageTexture:
	var image = Image.create(30, 30, false, Image.FORMAT_RGBA8)
	image.fill(color)
	return ImageTexture.create_from_image(image)

func addNewOption(color: Color) -> void:
	var index = colorSelect.item_count
	colorSelect.add_item("")
	colorSelect.set_item_icon(index, addColorTexture(color))

func _ready() -> void:
	for color in Constants.DEFAULT_COLORS:
		if color.displayName != "Neutral":
			addNewOption(Color.hex(color.base))

func sendUpdates() -> void:
	newPlayerUpdate.emit(playerNumber, playerName, playerColor)

#func _on_color_selected(index: int) -> void:
	#pass # Replace with function body.

func _on_player_name_text_changed(new_text: String) -> void:
	playerName = new_text
	sendUpdates()


func _on_color_selected(index: int) -> void:
	playerColor = index
	sendUpdates()
