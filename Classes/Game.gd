extends Node

class_name Game

var deck: Deck = Deck.new() # it doesn't feel like I'm doing this right
const players: Array[Player] = []
var round: int = 1
var currentPlayer: Player
const regions: Array[Region] = []
