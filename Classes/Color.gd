extends Node


class_name PlayerColor


var displayName: String
var hex: int
var stroke: int


func _init(color: Dictionary) -> void:
	displayName = color.displayName
	hex = color.base
	stroke = color.stroke
