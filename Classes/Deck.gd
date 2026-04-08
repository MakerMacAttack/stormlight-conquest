extends Resource


class_name Deck


var cards: Array[Card] = []


func _init(regions: Array[Region]) -> void:
	regions.shuffle()
	for i in regions.size():
		var denomination = Constants.DENOMINATIONS[i % 3]
		cards.append(Card.new(regions[i], denomination))
