extends CharacterBody2D
@onready var tile_map = $"../WalkableLayer"
@onready var tile_map_unwalkable = $"../UnwalkableLayer"
@onready var concentration_bar = $ConcentrationBar
@onready var turn_manager = $"../TurnManager"

var astar_grid = AStarGrid2D
var tile_size: Vector2 = Vector2(16, 16)
var current_id_path: Array[Vector2i]
var character_speed: float = 2
var is_moving: bool 

func init_astar():
	# Init A*
	astar_grid = AStarGrid2D.new()
	# Configurations
	astar_grid.region = tile_map.get_used_rect()
	astar_grid.cell_size = tile_size
	astar_grid.diagonal_mode = astar_grid.DIAGONAL_MODE_NEVER
	astar_grid.update()

func astar_layer_create_solid(tile_map_layer):
	# Loop over unwalkable layer, if cell exists, tell A* to set its graph to solid
	for x in tile_map_layer.get_used_rect().size.x:
		for y in tile_map_layer.get_used_rect().size.y:
			var cur_tile_pos = Vector2i(
				x + tile_map_layer.get_used_rect().position.x,
				y + tile_map_layer.get_used_rect().position.y)
				
			if tile_map_layer.get_cell_source_id(cur_tile_pos) != -1:
				astar_grid.set_point_solid(cur_tile_pos, true)
				
func _ready() -> void:
	init_astar()
	astar_layer_create_solid(tile_map_unwalkable)
	
	
func _input(event):
	if event.is_action_pressed("move") == false:
		return
		
	if turn_manager.check_current_turn() != "player":
		return
	# id_path prints out an array of the path
	
	var id_path = astar_grid.get_id_path(
		tile_map.local_to_map(global_position),
		tile_map.local_to_map(get_global_mouse_position())
	).slice(1)
	
	
	if id_path.is_empty() == false and is_moving == false:
		current_id_path = id_path
		is_moving = true
		concentration_bar.increase(5)
		


func _physics_process(_delta: float) -> void:
	if current_id_path.is_empty(): return
	
	var target_pos = tile_map.map_to_local(current_id_path.front())
	
	# Move Logic
	global_position = global_position.move_toward(target_pos, character_speed)
	
	if global_position == target_pos: 
		current_id_path.pop_front()
		if current_id_path.is_empty():
			is_moving = false
	
