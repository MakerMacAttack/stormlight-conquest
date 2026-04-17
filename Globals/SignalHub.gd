extends Node
#this will handle any and all signals


signal gameBegin
signal refreshLabels

signal endReinforce
signal endCombat

signal gameWon
signal resetGame


func onBeginPressed(numberOfPlayers, playerDetails) -> void:
	gameBegin.emit(numberOfPlayers, playerDetails)

func onUpdateTroops() -> void:
	refreshLabels.emit()

func onReinforcementBonusZero() -> void:
	endReinforce.emit()

func onCombatEnd() -> void:
	endCombat.emit()

func onVictory() -> void:
	gameWon.emit()

func onRestart() -> void:
	resetGame.emit()
