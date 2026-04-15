extends Control

class_name Attack


@onready var select_attacker: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer/selectAttacker
@onready var select_defender: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer2/selectDefender
@onready var select_force: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer3/selectForce

@onready var attack_button: Button = $vBoxContainer/hBoxContainer2/attackButton
@onready var auto_attack_button: Button = $vBoxContainer/hBoxContainer2/autoAttackButton

@onready var stop_button: Button = $vBoxContainer/stopButton




func _on_stop_button_pressed() -> void:
	SignalHub.onCombatEnd()
