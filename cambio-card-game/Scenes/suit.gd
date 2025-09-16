extends TextureRect
var image = null

func _process(delta: float) -> void:
	texture = load(image)
