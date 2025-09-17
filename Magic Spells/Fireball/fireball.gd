extends Node2D


"""
Note: When being selected, display preview outline and mana cost.

show_preview()
- take mouse position
- local_to_map()
- highlight area (based on radius)

Note: Method of accessing Level is very fragile, consider better alternatives
Note: Remember to turn aoe_sprite on and off open-endedly
"""
@export var skill: MagicSkill
var is_selected: bool = true

@onready var level = get_node("/root/BattleRoom/Level")
@onready var spellbook = get_parent()
@onready var player = spellbook.get_parent()
@onready var aoe = $AreaOfEffect
@onready var aoe_sprite = $AreaOfEffect/Sprite2D


func debug_print_path(): # Check for if paths are connected
	print("-- From Fireball --")
	print("Level: ", level.name)
	print("Spellbook: ", spellbook.name)
	print("Player: ", player.name)
	print("AOE: ", aoe.name)
	print("AOE Sprite: ", aoe_sprite.name)

func toggle_sprite(toggle: bool):
	if toggle:
		$Sprite2D.visible = true
	else:
		$Sprite2D.visible = false


func toggle_aoe(toggle: bool):
	if toggle:
		aoe_sprite.visible = true
	else:
		aoe_sprite.visible = false

func show_preview():
	# get mouse position
	var mouse_pos = get_global_mouse_position()
	# convert to tile position (Level's tilemap)
	var tile_pos = level.tile_map.local_to_map(mouse_pos)
	# for testing, continously print tile position

	# create object aoe at tile_pos
	aoe.global_position = level.tile_map.map_to_local(tile_pos)
	

"""
Upon casting spell:
- Check for mana cost
- Deduct mana from player
- Apply damage to enemies in area of effect
- Start cooldown timer (Implement later	)

"""


func cast_spell():
	if player.stats.current_mana < skill.mana_cost:
		print("Not enough mana!")
		return
	else:
		var bodies = aoe.get_overlapping_bodies()
		for body in bodies:
			print("Body in AOE: ", body.name)
			body.take_damage(skill.damage)
		# Start cooldown timer (Implement later)
	
	pass



func init_skill():
	skill = MagicSkill.new()	
	skill.skill_name = "Fireball"
	skill.mana_cost = 30
	skill.cooldown = 1
	skill.damage = 30

func _ready():

	init_skill()
	# debug_print_path()
	toggle_sprite(false)
	toggle_aoe(false)

func _physics_process(_delta: float) -> void:
	if is_selected:
		show_preview()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("cast_current_spell"):
		cast_spell()
