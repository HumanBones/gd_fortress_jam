extends KinematicBody2D

# EXPORTS
####



export var movement_speed = 85.0


# ONREADY VARS
###
onready var anim = $Player_Animation #animationPlayer #Run #Idle

# OVERRIDES
####

func _ready():
	anim.play("Idle")


func _process(delta):
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()

func _physics_process(_delta):
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
	
	#Playes animation if moving
	if direction != Vector2.ZERO:
		anim.play("Run")
		if direction.x == -1:
			$sprite_player.flip_h = true
		elif direction.x == 1:
			$sprite_player.flip_h = false
	else:
		anim.play("Idle")
		
