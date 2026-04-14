extends Node
#this will handle any and all signals


signal gameBegin
signal refreshLabels


func onBeginPressed(numberOfPlayers, playerDetails) -> void:
	gameBegin.emit(numberOfPlayers, playerDetails)

func onUpdateTroops() ->void:
	refreshLabels.emit()
