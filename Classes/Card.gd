extends Resource


class_name Card


var region: Region
var denomination: String
var currentPlayer: Player


func _init(newRegion: Region, newDenomination: String) -> void:
	region = newRegion
	denomination = newDenomination
