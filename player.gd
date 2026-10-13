extends CharacterBody2D

const ACCELERATION = 300
const MAX_SPEED = 800
const JUMP_FORCE = -400
const FRICTION = 30

func _physics_process(delta):
	#gravity
	velocity += get_gravity() * delta
	
	#jump
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_FORCE
		
	#left/right
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x += ACCELERATION * delta * direction
		
		if velocity.x > MAX_SPEED:
			velocity.x = MAX_SPEED
		if velocity.x < -MAX_SPEED:
			velocity.x = -MAX_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)

	move_and_slide()
