extends Node2D

@onready var player = $Player

func _input(event):
	if event.is_action_pressed("move"):
		player.global_position = get_global_mouse_position()
		
	
