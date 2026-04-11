extends Resource


class_name Region


var displayName: String:
	set(value):
		displayName = value
	get:
		return displayName
var currentOwner: Player
var troops: int:
	set(value):
		troops = value
	get:
		return troops
var blades: int
var plate: int
var manualId: int
var borders: Array
var spawnPoint: Vector2

func _init(newRegion: Dictionary, newOwner: Player) -> void:
	troops = 3
	blades = 0
	plate = 0
	displayName = newRegion.displayName
	manualId = newRegion.manualId
	borders = newRegion.borders
	currentOwner = newOwner
	spawnPoint = Vector2(newRegion.mapX, newRegion.mapY)

func displayTroops() -> void:
	print('%d troops' % [troops])

func displayId() -> void:
	print(get_instance_id())
