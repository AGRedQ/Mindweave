extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenne/Village.tscn") # Replace with function body.




func _on_quit_pressed() -> void:
	$ConfirmQuit.show() # Replace with function body.


func _on_confirm_quit_confirmed():
	get_tree().quit()
