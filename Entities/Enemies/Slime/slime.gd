extends CharacterBody2D

@export var stats: Stats
@onready var level_grid = $"../../../Level"


func init_stats():
	stats = Stats.new()
	stats.max_hp = 50
	stats.current_hp = 50
	stats.max_mana = 0
	stats.current_mana = 0
	stats.strength = 5
	stats.dexterity = 5
	stats.speed = 5
	stats.intelligence = 2

func print_stats():
	print("Slime Stats:")
	print("HP: %d/%d" % [stats.current_hp, stats.max_hp])
	print("Mana: %d/%d" % [stats.current_mana, stats.max_mana])
	print("Strength: %d" % stats.strength)
	print("Dexterity: %d" % stats.dexterity)
	print("Speed: %d" % stats.speed)
	print("Intelligence: %d" % stats.intelligence)

func _ready() -> void:
	init_stats()
	print_stats()
	
