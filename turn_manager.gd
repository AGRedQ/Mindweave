extends Node2D

var turn_queue: Array 	
@onready var allies_path = $Actors/Allies
@onready var enemies_path = $Actors/Enemies
var enemies: Array
var allies: Array


func allies_go_first() -> bool:
	var total_allies_spd: float = 0
	var total_enemies_spd: float = 0
	
	for ally in allies:
		if ally.has_variable("speed"):
			total_allies_spd += ally.speed
			
	for enemy in enemies:
		if enemy.has_variable("speed"):
			total_enemies_spd += enemy.speed
	
	var avg_allies_spd = total_allies_spd / allies.size()
	var avg_enemies_spd = total_enemies_spd / enemies.size()
	
	return avg_allies_spd >= avg_enemies_spd
	
	
	
func init_turn_queue():
	for ally in allies_path.get_children():
		allies.append(ally.name)
	for enemy in enemies_path.get_children():
		enemies.append(enemy.name)
	
			
func check_current_turn():
	if turn_queue.is_empty():
		return 
	else: return turn_queue[0]
func next_turn():
	turn_queue.pop_front()
	
func _ready() -> void:
	init_turn_queue()
	for ally in allies:
		print("Ally: ", ally)
	
	for enemy in enemies:
		print("Enemy: ", enemy)	
	
	
