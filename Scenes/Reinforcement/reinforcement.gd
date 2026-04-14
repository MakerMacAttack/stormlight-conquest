extends Control


class_name Reinforcement


@onready var select_bonus: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer2/selectBonus
@onready var select_region: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer/selectRegion


var currentPlayer: Player
var territories: Array[Region] = []:
	set(newTerritories):
		select_region.clear()
		for i in newTerritories.size():
			territories.append(newTerritories[i])
			select_region.add_item(newTerritories[i].displayName, newTerritories[i].get_instance_id())
			print(newTerritories[i].get_instance_id())
	get:
		return territories
var bonus: int = 0:
	set(change):
		select_bonus.clear()
		bonus += change
		for i in bonus:
			print(i)
			select_bonus.add_item(str(i), i)
const pity: int = 3


signal reinforce
signal reinforcePhaseEnd


func addToBonus(extraBonus) -> void:
	bonus += extraBonus

func _on_reinforce_button_pressed() -> void:
	pass # Replace with function body.
	# prolly I'll have to emit something here with the ID and increase troop strength by that amount
	
