extends Control


class_name TurnChange


@onready var new_player: Label = $colorRect/panelContainer/vBoxContainer/newPlayer


var nextPlayer: Player:
	set(newPlayer):
		nextPlayer = newPlayer
		new_player.text = newPlayer.displayName
		var newLabelSettings: LabelSettings = LabelSettings.new()
		newLabelSettings.font_color = newPlayer.colorTheme.hex
		newLabelSettings.outline_color = newPlayer.colorTheme.stroke
		newLabelSettings.outline_size = 10
		newLabelSettings.font_size = 30
		new_player.label_settings = newLabelSettings


func _on_continue_pressed() -> void:
	SignalHub.onStartNewTurn()
