extends Control

class_name Attack


@onready var select_attacker: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer/selectAttacker
@onready var select_defender: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer2/selectDefender
@onready var select_force: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer3/selectForce

@onready var attack_button: Button = $vBoxContainer/hBoxContainer2/attackButton
@onready var auto_attack_button: Button = $vBoxContainer/hBoxContainer2/autoAttackButton

@onready var stop_button: Button = $vBoxContainer/stopButton


var currentPlayer: Player # a setter to populate the first dropdown?
var allRegions: Array[Region]
var attackingRegions: Array[Region]
var defendingRegions: Array[Region]
var selectedAttacker: Region
var selectedDefender: Region
var attackForce: int # consider a setter that caps it at 3?


func _on_stop_button_pressed() -> void:
	SignalHub.onCombatEnd()


func _on_attacker_selected(index: int) -> void:
	if index > 0:
		selectedAttacker = attackingRegions[index]
		var neighbors = selectedAttacker.borders
		var possibleDefenders = allRegions.filter(func(region): region.manualId in neighbors && region.currentOwner != currentPlayer)
