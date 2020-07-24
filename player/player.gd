extends KinematicBody2D

# EXPORTS
####

export var movement_speed = 85.0

# OVERRIDES
####

func _physics_process(delta):
	movement()

# USER DEFINED
####

func movement():
	var direction = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT
	
	if Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT
		
	if Input.is_action_pressed("ui_down"):
		direction += Vector2.DOWN
		
	if Input.is_action_pressed("ui_up"):
		direction += Vector2.UP
	
	move_and_slide(movement_speed * direction)
