extends CharacterBody2D

@export var speed: float = 150.0
@onready var anim: AnimatedSprite2D = $CharacterBody2D/AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	
	# Bắt input
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * speed
		
		anim.play("walk")   # cần có animation tên "walk"
		
		if direction.x < 0:
			anim.flip_h = true
		elif direction.x > 0:
			anim.flip_h = false
	else:
		velocity = Vector2.ZERO
		anim.play("idle")   # cần có animation tên "idle"
	
	move_and_slide()
