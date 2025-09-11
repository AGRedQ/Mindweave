extends Node2D

"""
Main Units: Manage Turn Order


"""

@onready var allies_group = $Allies
@onready var enemies_group = $Enemies

func print_units():
	print("Allies:")
	for ally in allies_group.get_children():
		print("- ", ally.name)
		
	print("Enemies:")
	for enemy in enemies_group.get_children():
		print("- ", enemy.name)


func _ready():
	# print_units()
	pass