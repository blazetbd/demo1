extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_pressed("jump"):
		$AnimatedSprite.play("jump_start")
	elif Input.is_action_pressed("left"):
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("right"):
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.play("idle")
	
	if velocity.y > 0:
		$AnimatedSprite.play("jump_end")
	
	
		
		
	

	move_and_slide()
