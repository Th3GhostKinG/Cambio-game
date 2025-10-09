class_name CARD
enum CARDSUIT { SPADES, HEARTS, DIAMONDS, CLUBS }
var cardSuit: CARDSUIT
var cardNumber : int
func _init(suit,number):
	cardSuit = suit
	cardNumber = number
func getCardSuit():
	return cardSuit
	
func geCardNumber():
	return cardNumber
