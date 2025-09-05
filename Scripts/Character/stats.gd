extends Node2D

var max_health: int 
var health: int

var max_mana: int 
var mana: int 

var speed:int 
var defense:int


	
func damage(amount): # lowering health
	health -= amount
	
func heal(amount): # upping health
	health += amount
	
func increase_max_health(amount):
	max_health += amount

func decrease_max_health(amount):
	max_health -= amount
