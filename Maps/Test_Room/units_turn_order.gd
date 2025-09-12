extends Node2D

"""
Main Units: Manage Turn Order


"""

@onready var allies_group = $Allies
@onready var enemies_group = $Enemies

func _ready():
	for ally in allies_group.get_children():
		print("Ally: ", ally.name)
		
	for enemy in enemies_group.get_children():
		print("Enemy: ", enemy.name)
