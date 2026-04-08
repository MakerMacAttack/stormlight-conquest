extends Resource


class_name Kingdom


var displayName: String
var lowerBound: int
var upperBound: int
var regions: Array[Region]
var bonus: int

func _init(kingdom: Dictionary) -> void:
	lowerBound = kingdom.lowerBound
	upperBound = kingdom.upperBound
	displayName = kingdom.displayName
	bonus = kingdom.bonus
	for i in kingdom.regions.length:
		regions.append(Region.new({"displayName": kingdom.regions[i], "manualId": kingdom.lowerBound + i}))
