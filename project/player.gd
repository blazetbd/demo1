extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		$AnimatedSprite.play("jump_end")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite.play("jump_start")
		

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x != 0 and is_on_floor():
		$AnimatedSprite.play("run")
	elif is_on_floor():
		$AnimatedSprite.play("idle")
	
	if velocity.x < 0:
		$AnimatedSprite.scale.x = -1
	elif velocity.x > 0:
		$AnimatedSprite.scale.x = 1
		
		
	

	move_and_slide()
