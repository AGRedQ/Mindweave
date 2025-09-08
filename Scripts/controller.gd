extends Node2D

@onready var player = $Player

func _input(event):
	if event.is_action_pressed("ui_down"):
		player.global_position += Vector2(0,16)
