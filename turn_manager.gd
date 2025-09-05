extends Node2D

var turn_queue: Array 	


func init_turn_queue():
	turn_queue.append("player")
	
func check_current_turn():
	return turn_queue[0]
	
func _ready() -> void:
	init_turn_queue()
