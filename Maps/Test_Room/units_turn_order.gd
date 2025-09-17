extends Node2D

"""
Main Units: Manage Turn Order
Implement Strategy: Queue

First, get all units into 2 arrays: Allies and Enemies
Sort each array by speed stat (descending)
Calculate average speed for each group
Compare and the team with the higher AVERAGE speed stat starts first.

Then, create a turn order queue based on speed stats of that group

"""

@onready var allies_group = $Allies
@onready var enemies_group = $Enemies
var allies: Array = []
var enemies: Array = []
var turn_order: Array = []


func get_units():
	allies = allies_group.get_children()
	enemies = enemies_group.get_children()

func debug_print_units():
	print("Allies:")
	for ally in allies:
		print("- ", ally.name)
	
	print("Enemies:")
	for enemy in enemies:
		print("- ", enemy.name)

	print("Turn Order:", turn_order)
	var initiative_team = get_initiative_team()
	print("Initiative Team: ", initiative_team)

func calc_average_speed(units: Array) -> float:
	if units.size() == 0:
		return 0.0
	var total_speed = 0
	for unit in units:
		total_speed += unit.stats.speed
	print("Total Speed: ", total_speed)
	return total_speed / units.size()


func get_current_turn_unit() -> Node:
	if turn_order.size() > 0:
		return turn_order[0]
	return null


func get_initiative_team() -> Array:
	if turn_order.size() > 0:
		return turn_order
	# Get average speed for both teams
	var allies_speed = calc_average_speed(allies)
	var enemies_speed = calc_average_speed(enemies)

	# Sort both teams by speed descending
	allies.sort_custom(func(a, b): return b.stats.speed - a.stats.speed)
	enemies.sort_custom(func(a, b): return b.stats.speed - a.stats.speed)
	# Assign turn_queue to the team based on results

	if allies_speed >= enemies_speed:
		turn_order = allies.duplicate()
		turn_order = turn_order + enemies.duplicate()
		return allies
	else:
		turn_order = enemies.duplicate() 
		turn_order = turn_order + allies.duplicate()
		return enemies




func _ready():
	get_units()
	debug_print_units()
	# Create turn order queue based on speed stats of that team
	pass

