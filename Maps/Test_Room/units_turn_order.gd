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

	get_initiative_team() 

	print(turn_order)

func calc_average_speed(units: Array) -> float:
	if units.size() == 0:
		return 0.0
	var total_speed = 0
	for unit in units:
		total_speed += unit.stats.speed
	return total_speed / units.size()


func pass_turn():
	if turn_order.size() <= 0:
		# If no units, refresh turn order
		get_initiative_team()
		return
	else:
		turn_order.pop_front()
		return

		


func get_current_turn_unit() -> Node:
	if turn_order.size() > 0:
		return turn_order[0]
	return null

func sort_by_speed(units: Array) -> Array: # Units won't be much, using bubble sort
	var sorted_units = units.duplicate()
	var n = sorted_units.size()
	for i in range(n):
		for j in range(0, n - i - 1):
			if sorted_units[j].stats.speed < sorted_units[j + 1].stats.speed:
				var temp = sorted_units[j]
				sorted_units[j] = sorted_units[j + 1]
				sorted_units[j + 1] = temp
	return sorted_units



func get_initiative_team() -> Array:
	if turn_order.size() > 0:
		return turn_order
	# Get average speed for both teams
	var allies_speed = calc_average_speed(allies)
	var enemies_speed = calc_average_speed(enemies)

	# Sort both teams by speed descending
	allies = sort_by_speed(allies)
	enemies = sort_by_speed(enemies)
	# Assign turn_queue to the team based on results
	print("Allies: ", allies)
	print("Enemies: ", enemies)

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
	# Create turn order queue based on speed stats of that team
	debug_print_units()
	pass
