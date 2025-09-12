extends CharacterBody2D

@export var stats: Stats


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



func _ready():
	init_stats()
	
	print("Player Stats:")
	print("HP: %d/%d" % [stats.current_hp, stats.max_hp])
	print("Mana: %d/%d" % [stats.current_mana, stats.max_mana])
	print("Strength: %d" % stats.strength)
	print("Dexterity: %d" % stats.dexterity)
	print("Speed: %d" % stats.speed)
	print("Intelligence: %d" % stats.intelligence)
