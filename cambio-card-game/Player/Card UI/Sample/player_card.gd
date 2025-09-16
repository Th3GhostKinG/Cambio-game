extends Node2D
var suit
var numberLabel1
var numberLabel2
var number

func _ready() -> void:
	suit = $TextureRect
	numberLabel1 = $Label
	numberLabel2 = $Label2
	suit.image = "res://Player/Card UI/Sample/hearts.png";
	numberLabel1.number = "K";
	numberLabel2.number = "K";
