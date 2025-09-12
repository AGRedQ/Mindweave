extends Node2D

"""
Level: Initializing AStar2DGrid for navigation and pathfinding logic

Units: Send queries to ask for direction

"""



@onready var tile_map = $WalkableLayer
@onready var tile_map_unwalkable = $UnwalkableLayer

var astar_grid = AStarGrid2D
var tile_size: Vector2 = Vector2(16, 16)
var current_id_path: Array[Vector2i]

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
				
		
func get_path_from_astar(current_location, target_location) -> Array[Vector2i]:
	var id_path: Array[Vector2i] = []
	
	# Convert to grid coordinates
	current_location = tile_map.local_to_map(current_location)
	target_location = tile_map.local_to_map(target_location)

	# Get path
	id_path = astar_grid.get_id_path(current_location, target_location).slice(1)
	return id_path

func _ready():
	init_astar()
	astar_layer_create_solid(tile_map_unwalkable)
