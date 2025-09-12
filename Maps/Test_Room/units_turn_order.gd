extends Node2D

"""
Main Units: Manage Turn Order


"""

@onready var allies_group = $Allies
@onready var enemies_group = $Enemies

<<<<<<< HEAD
func _ready():
	for ally in allies_group.get_children():
		print("Ally: ", ally.name)
		
	for enemy in enemies_group.get_children():
		print("Enemy: ", enemy.name)
=======
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
>>>>>>> 71667e78b7fcf1dab562a226aaf9e150bf769d23
