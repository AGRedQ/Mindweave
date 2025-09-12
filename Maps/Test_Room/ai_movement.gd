extends Node2D

"""
This is AI Movement Component

Note: sending raw position to Level to ask for id_path
Note2: Random movement within a range when "move" is pressed

"""

@onready var ai_character = $'..'
@onready var level_grid = $'../../../../Level'
var is_moving: bool = false
var target_position: Vector2
var id_path: Array[Vector2i]
var movement_range: float = 100.0  # Range for random movement
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func _input(event):
	if event.is_action_pressed("move") == false and is_moving == false:
		return
	
	if id_path.is_empty() == false:
		return
	
	# Generate random position within range
	var random_offset = Vector2(
		rng.randf_range(-movement_range, movement_range),
		rng.randf_range(-movement_range, movement_range)
	)
	
	target_position = ai_character.global_position + random_offset
	id_path = level_grid.get_path_from_astar(ai_character.global_position, target_position)
	
	print("AI moving to: ", target_position)
	print("AI path: ", id_path)

func _physics_process(_delta: float) -> void:
	if id_path.is_empty() == false: 
		is_moving = true
		var target_pos = level_grid.tile_map.map_to_local(id_path.front())
		# Move Logic
		ai_character.global_position = ai_character.global_position.move_toward(target_pos, 2)
		
		if ai_character.global_position == target_pos: 
			id_path.pop_front()
			if id_path.is_empty():
				is_moving = false