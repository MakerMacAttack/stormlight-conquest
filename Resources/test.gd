@tool

extends EditorScript

func _run() -> void:
	var regions: Array[Region]
	for region in Constants.DEFAULT_REGIONS:
		regions.append(Region.new(region))
	var deck = Deck.new(regions)
	print(deck.cards.pick_random().denomination)
