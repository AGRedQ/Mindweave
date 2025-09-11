extends Node2D

"""
Moving Component for Player Character

Note: sending raw position to Level to ask for id_path

"""


@onready var player = $'..'
@onready var level_grid = $'../../../../Level'
var is_moving: bool = false
var target_position: Vector2
var id_path: Array[Vector2i]



func _input(event):
	if event.is_action_pressed("move") == false and is_moving == false:
		return
	
	if id_path.is_empty() == false:
		return

	target_position = get_global_mouse_position()
	id_path = level_grid.get_path_from_astar(player.global_position, target_position)

	print("id_path: ", id_path)

func _physics_process(_delta: float) -> void:
	if id_path.is_empty() == false: 
		is_moving = true
		var target_pos = level_grid.tile_map.map_to_local(id_path.front())
		# Move Logic
		player.global_position = player.global_position.move_toward(target_pos, 2)
		
		if player.global_position == target_pos: 
			id_path.pop_front()
			if id_path.is_empty():
				is_moving = false
		
	
