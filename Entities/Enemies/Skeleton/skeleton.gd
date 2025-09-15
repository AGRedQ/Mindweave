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

func print_stats():
    print("Skeleton Stats:")
    print("HP: %d/%d" % [stats.current_hp, stats.max_hp])
    print("Mana: %d/%d" % [stats.current_mana, stats.max_mana])
    print("Strength: %d" % stats.strength)
    print("Dexterity: %d" % stats.dexterity)
    print("Speed: %d" % stats.speed)
    print("Intelligence: %d" % stats.intelligence)


func _ready():
    init_stats()
    # print_stats()

func take_damage(amount: int):
    stats.current_hp -= amount
    if stats.current_hp <= 0:
        die()

func die():
    queue_free()

    