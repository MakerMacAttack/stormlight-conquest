extends Control


class_name Reinforcement


@onready var select_bonus: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer2/selectBonus
@onready var select_region: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer/selectRegion
@onready var reinforce_button: Button = $vBoxContainer/reinforceButton


var currentPlayer: Player
var territories: Array[Region] = []:
	set(newTerritories):
		select_region.clear()
		select_region.add_item("-", 0)
		for i in newTerritories.size():
			territories.append(newTerritories[i])
			select_region.add_item(newTerritories[i].displayName, newTerritories[i].get_instance_id())
	get:
		return territories
var bonus: int = 0:
	set(change):
		select_bonus.clear()
		select_bonus.add_item("-", 0)
		bonus += change
		for i in bonus:
			select_bonus.add_item(str(i+1), i+1)
var selectedRegion: Region
var selectedBonus: int = 0


signal reinforcePhaseEnd


func addToBonus(extraBonus) -> void:
	bonus += extraBonus

func _on_reinforce_button_pressed() -> void:
	if selectedRegion == null || selectedBonus == 0:
		pass
	else:
		print(selectedRegion.troops)
		print(selectedRegion.displayName)
		print(select_bonus)
		selectedRegion.troops = selectedRegion.troops + selectedBonus
		print(selectedRegion.troops)
		bonus = -1 * selectedBonus # because I'm using a setter I have to pass it this way
		selectedRegion = null
		selectedBonus = 0
		select_bonus.select(0)
		select_region.select(0)
	SignalHub.onUpdateTroops()
	# if bonus now equals 0, emit the signal that this phase is done.


func _on_select_region_selected(index: int) -> void:
	if index > 0:
		selectedRegion = territories[index-1]
	else:
		selectedRegion = null
	checkEnable()

func _on_select_bonus_selected(index: int) -> void:
	selectedBonus = index
	checkEnable()

func checkEnable() -> void:
	if selectedBonus > 0 && selectedRegion != null:
		reinforce_button.disabled = false
	else:
		reinforce_button.disabled = true
