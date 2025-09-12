extends Node2D


"""
Note: When being selected, display preview outline and mana cost.

show_preview()
- take mouse position
- local_to_map()
- highlight area (based on radius)

<<<<<<< HEAD

"""
@export var skill: MagicSkill
var is_selected: bool = false

var spellbook = get_parent()
var player = spellbook.get_parent()
var tile_map = player.get_parent().get_node("WalkableLayer")


func init_skill():
	skill = MagicSkill.new()
=======
Note: Method of accessing Level is very fragile, consider better alternatives

"""
@export var skill: MagicSkill
var is_selected: bool = true

@onready var level = get_node("/root/BattleRoom/Level")
@onready var spellbook = get_parent()
@onready var player = spellbook.get_parent()


func debug_print_path(): # Check for if paths are connected
	print("-- From Fireball --")
	print("Level: ", level.name)
	print("Spellbook: ", spellbook.name)
	print("Player: ", player.name)

func show_preview():
	if is_selected == false:
		return
	# get mouse position
	var mouse_pos = get_global_mouse_position()
	# convert to tile position (Level's tilemap)
	var tile_pos = level.tile_map.local_to_map(mouse_pos)
	# for testing, continously print tile position
	print("Mouse Tile Position: ", tile_pos)






func init_skill():
	skill = MagicSkill.new()	
>>>>>>> 71667e78b7fcf1dab562a226aaf9e150bf769d23
	skill.skill_name = "Fireball"
	skill.mana_cost = 30
	skill.cooldown = 1
	skill.damage = 30

func _ready():
	init_skill()
<<<<<<< HEAD


func show_preview():
	# Display preview outline and mana cost
	var mouse_pos = get_global_mouse_position()
	var center_cell = tile_map.local_to_map(mouse_pos)

	var radius = 1
	for x_offset in range(-radius, radius + 1):
		for y_offset in range(-radius, radius + 1):
			var cell = center_cell + Vector2i(x_offset, y_offset)
			tile_map.set_cell(0, cell, 1) # Assumes tile 1 is the highlight tile



func _physics_process(_delta: float) -> void:
	if is_selected:
		show_preview()


	pass
=======
	debug_print_path()

func _physics_process(_delta: float) -> void:
	show_preview()
>>>>>>> 71667e78b7fcf1dab562a226aaf9e150bf769d23
