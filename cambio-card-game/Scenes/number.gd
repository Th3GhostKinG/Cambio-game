extends Label
var number = null
var color = null

func _process(delta: float) -> void:
	text = number
	modulate = color
