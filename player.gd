extends CharacterBody2D

const ACCELERATION = 5
const MAX_SPEED = 10
const JUMP_FORCE = -100
const FRICTION = -100

func _physics_process(delta):
	#jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE
		
	#left/right
	var direction = Input.get_axis("left", "right")
	if direction != 0:
		velocity.x += ACCELERATION * delta * direction
		
		if velocity.x > MAX_SPEED:
			velocity.x = MAX_SPEED
		if velocity.x < -MAX_SPEED:
			velocity.x = -MAX_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)

	move_and_slide()
