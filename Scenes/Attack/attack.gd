extends Control

class_name Attack


@onready var select_attacker: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer/selectAttacker
@onready var select_defender: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer2/selectDefender
@onready var select_force: OptionButton = $vBoxContainer/hBoxContainer/vBoxContainer3/selectForce
@onready var select_advance: OptionButton = $vBoxContainer/conquered/selectAdvance

@onready var combat_results: Label = $vBoxContainer/combatResults
@onready var conquered: HBoxContainer = $vBoxContainer/conquered

@onready var attack_button: Button = $vBoxContainer/hBoxContainer2/attackButton
@onready var auto_attack_button: Button = $vBoxContainer/hBoxContainer2/autoAttackButton
@onready var advance_button: Button = $vBoxContainer/conquered/advanceButton

@onready var stop_button: Button = $vBoxContainer/stopButton


var currentPlayer: Player # a setter to populate the first dropdown?
var allRegions: Array[Region]
var attackingRegions: Array[Region]:
	set(newAttackers):
		attackingRegions = newAttackers
		select_attacker.clear()
		select_attacker.add_item("-")
		for attacker in attackingRegions:
			select_attacker.add_item(attacker.displayName)
var defendingRegions: Array[Region]:
	set(newDefenders):
		defendingRegions = newDefenders
		select_defender.clear()
		select_defender.add_item("-")
		for defender in defendingRegions:
			select_defender.add_item(defender.displayName)
var selectedAttacker: Region
var selectedDefender: Region:
	set(defender):
		selectedDefender = defender
		checkCanCombat()
var forceOptions: int: # consider a setter that caps it at 3?
	set(force):
		select_force.clear()
		select_force.add_item("-")
		if force != 0:
			forceOptions = clamp(force, 1, 3)
			for i in forceOptions:
				select_force.add_item(str(i + 1))
		else:
			forceOptions = 0
var attackForce: int:
	set(force):
		attackForce = force
		checkCanCombat()
var advancingTroops: int
var minimumAdvance: int

func autoBattle(attacker: int, defender: int) -> Dictionary:
	var attackerForce = attacker
	var defenderForce = defender
	while (attackerForce > 4) && (defenderForce > 2):
		var result = battle(clamp(attackerForce, 0, 3), clamp(defenderForce, 0, 2))
		attackerForce -= result.attackerLosses
		defenderForce -= result.defenderLosses
	return {"attackerForce": attackerForce, "defenderForce": defenderForce}

func battle(attacker: int, defender: int) -> Dictionary:
	var attackerLosses: int = 0
	var defenderLosses: int = 0
	var attacks: Array[int] = []
	for i in attacker:
		attacks.append(dieRoll(6))
	var defenses: Array[int] = []
	for i in defender:
		defenses.append(dieRoll(6))
	attacks.sort_custom(sortDescending)
	defenses.sort_custom(sortDescending)
	for i in defenses.size():
		if attacks[i] > defenses[i]:
			defenderLosses += 1
		else:
			attackerLosses += 1
	#print("%d, %d" % [attackerLosses, defenderLosses])
	return {
		"attackerLosses": attackerLosses, 
		"defenderLosses": defenderLosses, 
		"Attacks": attacks, 
		"Defenses": defenses
	}

func dieRoll(dieSize: int) -> int:
	return randi() % dieSize + 1

func sortDescending(a: int, b:int) -> bool:
	return a > b


func _on_stop_button_pressed() -> void:
	SignalHub.onCombatEnd()

func _on_attacker_selected(index: int) -> void:
	#combat_results.text = "Line1\nLine2\nLine3"
	if index > 0:
		selectedAttacker = attackingRegions[index - 1]
		var neighbors = selectedAttacker.borders
		var possibleDefenders: Array[Region]
		# = allRegions.filter(func(region): region.manualId in neighbors && region.currentOwner != currentPlayer)
		for region in allRegions:
			if region.manualId in neighbors && region.currentOwner != currentPlayer:
				possibleDefenders.append(region)
		defendingRegions = possibleDefenders
		forceOptions = selectedAttacker.troops - 1

func checkCanCombat() -> void:
	var canCombat = selectedAttacker != null && selectedDefender != null && attackForce > 0 && !conquered.visible
	attack_button.disabled = !canCombat
	auto_attack_button.disabled = !canCombat

func setAdvance(lowest: int, highest:int) -> void:
	select_advance.clear()
	select_advance.add_item("-")
	minimumAdvance = lowest - 1
	#print("Lowest: %d. Highest: %d. Minimum: %d." % [lowest, highest, minimumAdvance])
	if highest >= lowest:
		for i in range(lowest, highest + 1):
			select_advance.add_item(str(i))
	else:
		select_advance.add_item(str(lowest))

func _on_defender_selected(index: int) -> void:
	if index > 0:
		selectedDefender = defendingRegions[index -1]
	else:
		selectedDefender = null

func _on_force_selected(index: int) -> void:
	attackForce = index


func _on_attack_button_pressed() -> void:
	var result = battle(attackForce, clamp(clamp(selectedDefender.troops, 1, attackForce),1, 2))
	#print(result)
	selectedAttacker.troops -= result.attackerLosses
	selectedDefender.troops -= result.defenderLosses
	var attackDisplay = ", ".join(result.Attacks) # figure out gdscript for join
	var defenseDisplay = ", ".join(result.Defenses)
	combat_results.text = "Attacker rolls were: %s\nDefender rolls were: %s\nAttacker loses %d and defender loses %d." % [attackDisplay, defenseDisplay, result.attackerLosses, result.defenderLosses]
	if selectedAttacker.troops == 1:
		resetAttacker()
	else:
		var prevForceStrength = attackForce # something here, I think, is letting me risk more troops than I ought
		forceOptions = selectedAttacker.troops - 1
		if prevForceStrength <= forceOptions:
			select_force.select(prevForceStrength)
		else:
			select_force.select(forceOptions)
			attackForce = forceOptions
	# Check for conquering
		if selectedDefender.troops < 1: #somehow selected defender was missing when the code got here
			stop_button.disabled = true
			selectedDefender.currentOwner = currentPlayer
			var victory: bool = true
			for region in allRegions:
				if region.currentOwner != currentPlayer:
					victory = false
					break
			if victory:
				SignalHub.onVictory()
			else:
				setAdvance(attackForce - result.attackerLosses, selectedAttacker.troops -1)
				attack_button.disabled = true
				auto_attack_button.disabled = true
				conquered.visible = true


func _on_advance_selected(index: int) -> void:
	#print("Index: %d. Minimum: %d." % [index, minimumAdvance])
	if index > 0:
		advancingTroops = index + minimumAdvance
		advance_button.disabled = false


func _on_advance_button_pressed() -> void:
	print("Attacker's troops: %d. Amount to move: %d." % [selectedAttacker.troops, advancingTroops])
	selectedAttacker.troops -= advancingTroops
	selectedDefender.troops += advancingTroops
	advance_button.disabled = true
	conquered.visible = false
	select_advance.clear()
	resetAttacker()
	stop_button.disabled = false

func resetAttacker() -> void:
	selectedAttacker = null
	selectedDefender = null
	attackForce = 0
	attackingRegions = []
	defendingRegions = []
	forceOptions = 0
	# reset list of possible attackers
	var possibleAttackers: Array[Region]
	for region in allRegions:
		if region.currentOwner == currentPlayer && region.troops > 1:
			possibleAttackers.append(region)
	var canAttack: Array[Region]
	#print(canAttack)
	for aggressor in possibleAttackers:
		var hasFoe: bool = false
		#var possibleDefenders: Array[Region]
		for region in allRegions:
			if region.currentOwner != currentPlayer && aggressor.borders.has(region.manualId):
				hasFoe = true
				break
		if hasFoe:
			canAttack.append(aggressor)
	attackingRegions = canAttack


func _on_auto_attack_pressed() -> void:
	var result = autoBattle(selectedAttacker.troops, selectedDefender.troops)
	selectedAttacker.troops = result.attackerForce
	selectedDefender.troops = result.defenderForce


func _on_stop_pressed() -> void:
	SignalHub.onCombatEnd()
