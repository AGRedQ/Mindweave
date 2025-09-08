extends Node2D

var turn_queue: Array 	
@onready var allies = $Actors/Allies


func init_turn_queue():
	turn_queue.append("enemies")
	
func check_current_turn():
	return turn_queue[0]
	
func next_turn():
	turn_queue.pop_front()
	
func _ready() -> void:
	init_turn_queue()
	for child in allies.get_children():
		print("Child: ",child.name.to_lower())
