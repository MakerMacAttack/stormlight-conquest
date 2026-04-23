extends Node


class_name Game


#var deck: Deck = Deck.new() # it doesn't feel like I'm doing this right
var players: Array[Player] = []
#var round: int = 1
var currentPlayer: Player
var regions: Array[Region] = []
var advancePlayerTerminal: int = 0


func _init(numberOfPlayers: int, playerDetails: Array) -> void:
	for i in numberOfPlayers:
		var thisPlayer = Player.new(playerDetails[i][0], PlayerColor.new(Constants.DEFAULT_COLORS[playerDetails[i][1]]))
		players.append(thisPlayer)
	# make a new array copying the default regions and then shuffle
	var thisRegions = []
	for region in Constants.DEFAULT_REGIONS:
		thisRegions.append(region)
	thisRegions.shuffle()
	# assign each region to a player
	for i in thisRegions.size():
		var newRegion: Region = Region.new(thisRegions[i], players[i % numberOfPlayers])
		regions.append(newRegion)
	# make a deck
	players.shuffle()
	currentPlayer = players.pop_front()

func advancePlayer() -> void:
	# check for terminal case, if so, go to Game Over
	players.append(currentPlayer)
	currentPlayer = players.pop_front()
	# loop through regions, if none of them are owned by current player:
	# advance terminal, advancePlayer again.
	# else, reset terminal to 0

func autoBattle(attacker: int, defender: int) -> Dictionary:
	var attackerForce = attacker
	var defenderForce = defender
	while (attackerForce > 4) || (defenderForce > 0):
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
	attacks.sort_custom(sortAscending)
	defenses.sort_custom(sortAscending)
	print(attacks)
	print(defenses)
	while (attacks.size() > 0) && (defenses.size() > 0):
		if attacks.pop_front() > defenses.pop_front():
			attackerLosses += 1
		else:
			defenderLosses += 1
	print("%d, %d" % [attackerLosses, defenderLosses])
	return {"attackerLosses": 1, "defenderLosses": 2}

func dieRoll(dieSize: int) -> int:
	return randi() % dieSize + 1

func sortAscending(a: int, b:int) -> bool:
	return b > a
