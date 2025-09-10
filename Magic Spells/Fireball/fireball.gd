extends Node2D


"""
Note: When being selected, display preview outline and mana cost.

show_preview()
- take mouse position
- local_to_map()
- highlight area (based on radius)


"""
@export var skill: MagicSkill
var is_selected: bool = false

var spellbook = get_parent()
var player = spellbook.get_parent()
var tile_map = player.get_parent().get_node("WalkableLayer")


func init_skill():
    skill = MagicSkill.new()
    skill.skill_name = "Fireball"
    skill.mana_cost = 30
    skill.cooldown = 1
    skill.damage = 30

func _ready():
    init_skill()


func show_preview():
    # Display preview outline and mana cost
    var mouse_pos = get_global_mouse_position()
    var center_cell = tile_map.local_to_map(mouse_pos)

    var radius = 1
    for x_offset in range(-radius, radius + 1):
        for y_offset in range(-radius, radius + 1):
            var cell = center_cell + Vector2i(x_offset, y_offset)
            tile_map.set_cell(0, cell, 1) # Assumes tile 1 is the highlight tile



func _physics_process(_delta: float) -> void:
    if is_selected:
        show_preview()


    pass

