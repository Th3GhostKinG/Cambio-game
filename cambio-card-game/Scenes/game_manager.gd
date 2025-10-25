extends Node2D

var playerHand: Array[CARD] = [null, null, null, null]
var botOneHand: Array[CARD] = [null, null, null, null]
var botTwoHand: Array[CARD] = [null, null, null, null]
var botThreeHand: Array[CARD] = [null, null, null, null]
enum STATES {DRAW, ACTION, SPECIAL, OTHERSTURN} #special includes stealing cards
var curState = STATES.DRAW
var numbers: Array[float]
var cards: Array[CARD]

func _init() -> void:
	for n in range(1,53):
		var suit = n%4
		var newCard
		match suit:
			1:
				newCard = CARD.new(CARD.CARDSUIT.SPADES, n/4+int(n/4==0)*13)
			2:
				newCard = CARD.new(CARD.CARDSUIT.HEARTS, n/4+int(n/4==0)*13)
			3:
				newCard = CARD.new(CARD.CARDSUIT.DIAMONDS, n/4+int(n/4==0)*13)
			0:
				newCard = CARD.new(CARD.CARDSUIT.CLUBS, n/4+int(n/4==0)*13)
		cards.push_back(newCard)
	cards.shuffle()
	for n in range(0,16):
		var handNumber = n/4
		var player = (n+1)%4
		match player:
			1:
				playerHand[handNumber] = cards.pop_front()
			2:
				botOneHand[handNumber] = cards.pop_front()
			3:
				botTwoHand[handNumber] = cards.pop_front()
			0:
				botThreeHand[handNumber] = cards.pop_front()
	print(cards.size())
func _process(delta: float) -> void:
	match curState:
		STATES.ACTION:
			pass
			
		
