extends CharacterBody2D

@export var speed: float = 100.0   # tốc độ di chuyển

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	# Bắt input từ bàn phím
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1

	# Chuẩn hóa vector để di chuyển chéo không bị nhanh hơn
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	velocity = direction * speed
	move_and_slide()
