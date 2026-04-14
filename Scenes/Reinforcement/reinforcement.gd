extends Control


@onready var select_bonus: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer2/selectBonus
@onready var select_region: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer/selectRegion


var territories: Array[Region] = []
var bonus: int = 0


func addToBonus(extraBonus) -> void:
	bonus += extraBonus


func _on_reinforce_button_pressed() -> void:
	pass # Replace with function body.
