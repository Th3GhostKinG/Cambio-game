extends Node

var game_select = preload("res://Scenes/game_select.tscn").instantiate()

func _on_pressed() -> void:
	get_tree().root.add_child(game_select)
