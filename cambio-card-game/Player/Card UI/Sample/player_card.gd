extends Node2D
var suit
var numberLabel1
var numberLabel2
var number
var shown
var card_texture
var card_base

func _ready() -> void:
	shown = true
	card_base = $NinePatchRect
	suit = $TextureRect
	numberLabel1 = $Label
	numberLabel2 = $Label2
	card_base.image = "res://Player/Card UI/Sample/poker_card.png"
	suit.image = "res://Player/Card UI/Sample/hearts.png";
	numberLabel1.number = "K";
	numberLabel2.number = "K";
func _flip() -> void:
	shown = !shown
	if shown:
		card_base.image = "res://Player/Card UI/Sample/poker_card.png"
		suit.image = "res://Player/Card UI/Sample/hearts.png";
		numberLabel1.number = "K";
		numberLabel2.number = "K";
	else:
		card_base.image = "res://Player/Card UI/Sample/poker_card_flipped.png"
		suit.image = null;
		numberLabel1.number = "";
		numberLabel2.number = "";
		
	
