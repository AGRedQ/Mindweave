extends Control

signal confirmed
signal cancelled



func _on_button_pressed() -> void:
	emit_signal("confirmed") # Replace with function body.


func _on_button_2_pressed() -> void:
	emit_signal("cancelled")
	hide() # Replace with function body.
