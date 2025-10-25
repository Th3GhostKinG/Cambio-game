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
@export var bot_num:int
@export var game_manager:Node2D

func _init() -> void:
	pass
	
	
func _ready() -> void:
	shown = false
	suit = $TextureRect
	numberLabel1 = $Label
	numberLabel2 = $Label2
	card_base = $NinePatchRect
	card_base.image = "res://Player/Card UI/Sample/poker_card.png"
	_update_hand()
	suit.image = suitImage
	numberLabel1.color = fontColor
	numberLabel2.color = fontColor
	_cover()
func _flip() -> void:
	if game_manager.curState == game_manager.STATES.DRAW: #only used for testing
		shown = !shown
		if shown:
			card_base.image = "res://Player/Card UI/Sample/poker_card.png"
			suit.image = suitImage;
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
		else:
			_cover()
	elif game_manager.curState == game_manager.STATES.ACTION:
		match bot_num:
			1:
				game_manager.botOneHand[player_hand_number] = game_manager.cards.pop_front()
			2:
				game_manager.botTwoHand[player_hand_number] = game_manager.cards.pop_front()
			3:
				game_manager.botThreeHand[player_hand_number] = game_manager.cards.pop_front()		
		_update_hand()
		numberLabel1.color = fontColor
		numberLabel2.color = fontColor
		game_manager.curState = game_manager.STATES.SPECIAL
func _cover():
	card_base.image = "res://Player/Card UI/Sample/poker_card_flipped.png"
	suit.image = null;
	numberLabel1.number = "";
	numberLabel2.number = "";
func _update_hand():
	var handArray = null
	match bot_num:
			1:
				handArray = game_manager.botOneHand[player_hand_number]
			2:
				handArray = game_manager.botTwoHand[player_hand_number]
			3:
				handArray = game_manager.botThreeHand[player_hand_number]
	match handArray.getCardSuit():
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
	cardNum = handArray.cardNumber
#func _process(delta: float) -> void:
