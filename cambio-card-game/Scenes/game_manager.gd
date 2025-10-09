extends Node2D

var playerHand: Array[CARD] = [null, null, null, null]
var botOneHand: Array[CARD] = [null, null, null, null]
var botTwoHand: Array[CARD] = [null, null, null, null]
var botThreeHand: Array[CARD] = [null, null, null, null]
enum STATES {PREGAME, SHUFFLE, DRAW, ACTION, SPECIAL, OTHERSTURN}
var curState = STATES.PREGAME
var numbers: Array[float]
var cards: Array[CARD]

func _init() -> void:
	for n in range(1,53):
		var suit = n%4
		var newCard
		match suit:
			1:
				newCard = CARD.new(CARD.CARDSUIT.SPADES, n/4)
			2:
				newCard = CARD.new(CARD.CARDSUIT.HEARTS, n/4)
			3:
				newCard = CARD.new(CARD.CARDSUIT.DIAMONDS, n/4)
			0:
				newCard = CARD.new(CARD.CARDSUIT.CLUBS, n/4)
		cards.push_back(newCard)
	cards.shuffle()
	for n in range(0,52):
		print(cards[n].cardNumber)
	for n in range(0,16):
		var handNumber = n/4
		var player = (n+1)%4
		match player:
			1:
				playerHand[handNumber] = cards[n]
			2:
				botOneHand[handNumber] = cards[n]
			3:
				botTwoHand[handNumber] = cards[n]
			0:
				botThreeHand[handNumber] = cards[n]
		
func _process(delta: float) -> void:
	match curState:
		pass
			
		
