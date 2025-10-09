extends Node2D
var suit
var suitImage = "res://Player/Card UI/Sample/hearts.png"
var fontColor = Color.BLACK
var numberLabel1
var numberLabel2
var number
var card_texture
var card_base
var cardNum = 0
@export var game_manager:Node2D
func _init() -> void:
	pass
	
	
func _ready() -> void:
	suit = $TextureRect
	numberLabel1 = $Label
	numberLabel2 = $Label2
	card_base = $NinePatchRect
	card_base.image = "res://Player/Card UI/Sample/poker_card.png"
	match game_manager.cards[0].getCardSuit():
		CARD.CARDSUIT.SPADES:
			suitImage = "res://Player/Card UI/Sample/spades.png"
			fontColor = Color.BLACK
		CARD.CARDSUIT.HEARTS:
			suitImage = "res://Player/Card UI/Sample/hearts.png"
			fontColor = Color.RED
		CARD.CARDSUIT.DIAMONDS:
			suitImage = "res://Player/Card UI/Sample/diamonds.png"
			fontColor = Color.RED
		CARD.CARDSUIT.CLUBS:
			suitImage = "res://Player/Card UI/Sample/clubs.png"
			fontColor = Color.BLACK
	cardNum = game_manager.cards[0].cardNumber
	if cardNum >= 11:
		numberLabel1.number = String.chr("J".unicode_at(0)+cardNum-11);
		numberLabel2.number = String.chr("J".unicode_at(0)+cardNum-11);
	else:
		numberLabel1.number = str(cardNum);
		numberLabel2.number = str(cardNum);
	suit.image = suitImage
	numberLabel1.color = fontColor
	numberLabel2.color = fontColor
	_cover()
func _flip() -> void:
	card_base.image = "res://Player/Card UI/Sample/poker_card.png"
	_readTopCard()
	suit.image = suitImage;
	numberLabel1.color = fontColor
	numberLabel2.color = fontColor
	if cardNum >= 11:
		match cardNum:
			11:
				numberLabel1.number = "J"
				numberLabel2.number = "J"
			12:
				numberLabel1.number = "Q"
				numberLabel2.number = "Q"
			13:
				numberLabel1.number = "K"
				numberLabel2.number = "K"
	else:
		numberLabel1.number = str(cardNum);
		numberLabel2.number = str(cardNum);
	game_manager.curState = game_manager.STATES.ACTION
		
func _cover():
	card_base.image = "res://Player/Card UI/Sample/poker_card_flipped.png"
	suit.image = null;
	numberLabel1.number = "";
	numberLabel2.number = "";
	
func _readTopCard():
	match game_manager.cards[0].getCardSuit():
		CARD.CARDSUIT.SPADES:
			suitImage = "res://Player/Card UI/Sample/spades.png"
			fontColor = Color.BLACK
		CARD.CARDSUIT.HEARTS:
			suitImage = "res://Player/Card UI/Sample/hearts.png"
			fontColor = Color.RED
		CARD.CARDSUIT.DIAMONDS:
			suitImage = "res://Player/Card UI/Sample/diamonds.png"
			fontColor = Color.RED
		CARD.CARDSUIT.CLUBS:
			suitImage = "res://Player/Card UI/Sample/clubs.png"
			fontColor = Color.BLACK
	cardNum = game_manager.cards[0].cardNumber
func _process(delta: float) -> void:
	if game_manager.curState == game_manager.STATES.SPECIAL:
		_cover()
		game_manager.curState = game_manager.STATES.DRAW #used for testing
