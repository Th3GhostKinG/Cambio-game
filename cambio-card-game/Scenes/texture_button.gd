extends TextureButton

var card

func _ready() -> void:
	card = $".."
func _on_button_down() -> void:
	card._flip()
