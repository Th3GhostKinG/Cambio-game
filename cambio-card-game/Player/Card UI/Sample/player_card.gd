extends Node2D
var suit
var suitImage = "res://Player/Card UI/Sample/hearts.png"
var fontColor = Color.BLACK
var numberLabel1
var numberLabel2
var number
var shown
var card_texture
var card_base
var cardNum = 0
@export var player_hand_number:int
@export var game_manager:Node2D
func _init() -> void:
	pass
	
	
func _ready() -> void:
	shown = true
	suit = $TextureRect
	numberLabel1 = $Label
	numberLabel2 = $Label2
	card_base = $NinePatchRect
	card_base.image = "res://Player/Card UI/Sample/poker_card.png"
	match game_manager.playerHand[player_hand_number].getCardSuit():
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
	cardNum = game_manager.playerHand[player_hand_number].cardNumber
	if cardNum >= 11:
		numberLabel1.number = String.chr("J".unicode_at(0)+cardNum-11);
		numberLabel2.number = String.chr("J".unicode_at(0)+cardNum-11);
	else:
		numberLabel1.number = str(cardNum);
		numberLabel2.number = str(cardNum);
	suit.image = suitImage
	numberLabel1.color = fontColor
	numberLabel2.color = fontColor
func _flip() -> void:
	shown = !shown
	if shown:
		card_base.image = "res://Player/Card UI/Sample/poker_card.png"
		suit.image = suitImage;
		if cardNum >= 11:
			numberLabel1.number = String.chr("J".unicode_at(0)+cardNum-11);
			numberLabel2.number = String.chr("J".unicode_at(0)+cardNum-11);
		else:
			numberLabel1.number = str(cardNum);
			numberLabel2.number = str(cardNum);
	else:
		card_base.image = "res://Player/Card UI/Sample/poker_card_flipped.png"
		suit.image = null;
		numberLabel1.number = "";
		numberLabel2.number = "";
		
#func _process(delta: float) -> void:
