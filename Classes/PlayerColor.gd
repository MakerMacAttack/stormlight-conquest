extends Node


class_name PlayerColor


var displayName: String
var accessibilityCode: String
var hex: int
var stroke: int


func _init(color: Dictionary) -> void:
	displayName = color.displayName
	accessibilityCode = color.accessibilityCode
	hex = color.base
	stroke = color.stroke
