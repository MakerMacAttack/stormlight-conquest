@tool

extends EditorScript

func _run() -> void:
	#var regions: Array[Region]
	#for region in Constants.DEFAULT_REGIONS:
		#regions.append(Region.new(region))
	#var deck = Deck.new(regions)
	#for card in deck.cards:
		#if card.denomination == "Broam":
			#print("%s: %s" % [card.region.displayName, card.denomination])
	var result = autoBattle(9, 6)
	print(result)


func autoBattle(attacker: int, defender: int) -> Dictionary:
	var attackerForce = attacker
	var defenderForce = defender
	while (attackerForce > 4) && (defenderForce > 0):
		var result = battle(clamp(attackerForce, 0, 3), clamp(defenderForce, 0, 2))
		attackerForce -= result.attackerLosses
		defenderForce -= result.defenderLosses
		print("Current troops: Attacker %d, Defender %d" % [attackerForce, defenderForce])
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
	print(attacks)
	print(defenses)
	while (attacks.size() > 0) && (defenses.size() > 0):
		if attacks.pop_front() > defenses.pop_front():
			defenderLosses += 1
		else:
			attackerLosses += 1
	print("%d, %d" % [attackerLosses, defenderLosses])
	return {"attackerLosses": attackerLosses, "defenderLosses": defenderLosses}

func dieRoll(dieSize: int) -> int:
	return randi() % dieSize + 1

func sortDescending(a: int, b:int) -> bool:
	return b < a
