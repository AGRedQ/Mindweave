extends CharacterBody2D

"""
Note on variable Level: Spells are having trouble accessing Level node on their own.
- So passing Level node reference from Player to Spell when casting.

"""


@export var stats: Stats
@onready var level_grid = $"../../../Level"


func init_stats():
	stats = Stats.new()
	stats.max_hp = 100
	stats.current_hp = 100
	stats.max_mana = 50
	stats.current_mana = 50
	stats.strength = 20
	stats.dexterity = 15
	stats.speed = 10
	stats.intelligence = 10

func print_stats():
	print("Player Stats:")
	print("HP: %d/%d" % [stats.current_hp, stats.max_hp])
	print("Mana: %d/%d" % [stats.current_mana, stats.max_mana])
	print("Strength: %d" % stats.strength)
	print("Dexterity: %d" % stats.dexterity)
	print("Speed: %d" % stats.speed)
	print("Intelligence: %d" % stats.intelligence)




func _ready():
	init_stats()

	# print_stats()
