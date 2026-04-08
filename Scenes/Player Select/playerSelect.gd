extends Control


class_name PlayerSelect


@onready var player_detail_holder: VBoxContainer = $colorRect/panelContainer/vBoxContainer/playerDetailHolder
@onready var begin: Button = $colorRect/panelContainer/vBoxContainer/begin


const NEW_PLAYER_DETAILS = preload("res://Scenes/New Player Details/newPlayerDetails.tscn")


var playerDetails: Array[Array] = [[], [], [], [], [], []]
var numberOfPlayers: int


# function for when number of players changes
func _on_number_of_players_selected(index: int) -> void:
	begin.disabled = true
	numberOfPlayers = index + 3
	#clear out player details
	playerDetails = [[], [], [], [], [], []]
	#remove any current selections
	for n in player_detail_holder.get_children():
		n.queue_free()
	#populate detail holder with new select things
	for i in range(index + 3):
		var newDetails: NewPlayerDetails = NEW_PLAYER_DETAILS.instantiate()
		newDetails.custom_minimum_size = Vector2(0, 40)
		newDetails.playerNumber = i
		newDetails.newPlayerUpdate.connect(_on_new_player_details_update)
		player_detail_holder.add_child(newDetails)


func _on_new_player_details_update(idx: int, playerName: String, colorIdx: int) -> void:
	playerDetails[idx] = [playerName, colorIdx]
	#print(playerDetails)
	setBeginReady()

func setBeginReady() -> void:
	var readyToBegin = true
	var selectedColorIndices: Array[int] = []
	for i in numberOfPlayers:
		var current = playerDetails[i]
		if current.size() == 2:
			if !(current[0] != "" and current[1] >= 1):
				readyToBegin = false # technically at this point I could simply disable the button and quit.
			if selectedColorIndices.has(current[1]):
				readyToBegin = false
			selectedColorIndices.append(current[1])
		else:
			readyToBegin = false
	if readyToBegin:
		begin.disabled = false
	else: begin.disabled = true


func _on_begin_pressed() -> void:
	SignalHub.onBeginPressed(numberOfPlayers, playerDetails)
