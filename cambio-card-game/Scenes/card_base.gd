extends NinePatchRect
var image = null
func _process(delta: float) -> void:
	if image != null:
		texture = load(image)
	else:
		texture = null
