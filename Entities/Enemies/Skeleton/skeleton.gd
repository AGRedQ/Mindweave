extends CharacterBody2D


@export var stats: Stats

func init_stats():
    stats = Stats.new()
    stats.max_hp = 80
    stats.current_hp = 80
    stats.max_mana = 30
    stats.current_mana = 30
    stats.strength = 15
    stats.dexterity = 10
    stats.speed = 8
    stats.intelligence = 5

<<<<<<< HEAD
func _ready():
    init_stats()
=======
func print_stats():
>>>>>>> 71667e78b7fcf1dab562a226aaf9e150bf769d23
    print("Skeleton Stats:")
    print("HP: %d/%d" % [stats.current_hp, stats.max_hp])
    print("Mana: %d/%d" % [stats.current_mana, stats.max_mana])
    print("Strength: %d" % stats.strength)
    print("Dexterity: %d" % stats.dexterity)
    print("Speed: %d" % stats.speed)
    print("Intelligence: %d" % stats.intelligence)
<<<<<<< HEAD
=======


func _ready():
    init_stats()
    # print_stats()

>>>>>>> 71667e78b7fcf1dab562a226aaf9e150bf769d23
    