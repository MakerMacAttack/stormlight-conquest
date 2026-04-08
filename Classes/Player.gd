extends Node


class_name Player


var displayName: String # this maybe needs to be an export? And a var?
var colorTheme: Dictionary
var hand: Array[Card]
#Or name of color and I'll have a dict matching them?
#Or should I make a Color class with the display name, ID, and hex code?
#Nalthis would like that.

func _init(newColorTheme: Dictionary, newDisplayName: String = "Neutral") -> void:
	displayName = newDisplayName
	colorTheme = newColorTheme
