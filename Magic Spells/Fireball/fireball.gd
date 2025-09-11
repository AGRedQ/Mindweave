extends Node2D


"""
Note: When being selected, display preview outline and mana cost.

show_preview()
- take mouse position
- local_to_map()
- highlight area (based on radius)

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
	skill.skill_name = "Fireball"
	skill.mana_cost = 30
	skill.cooldown = 1
	skill.damage = 30

func _ready():
	init_skill()
	debug_print_path()

func _physics_process(_delta: float) -> void:
	show_preview()
