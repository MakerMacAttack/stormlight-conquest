extends Node
#this will handle any and all signals


signal gameBegin


func onBeginPressed(numberOfPlayers, playerDetails) -> void:
	gameBegin.emit(numberOfPlayers, playerDetails)
