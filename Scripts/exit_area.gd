extends Area2D

@export var next_scene: String = "res://Scenne/Forest.tscn" # đường dẫn scene mới

var entered: bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"): # chỉ Player mới kích hoạt
		entered = true
		get_tree().change_scene_to_file(next_scene)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		entered = false

func _process(delta: float) -> void:
	# Nếu bạn muốn bấm phím để vào map thay vì tự động
	if entered and Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file(next_scene)
