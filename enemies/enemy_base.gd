extends KinematicBody2D

var target = null

func _ready():
	$Animation.play("idle")

func _physics_process(_delta):
	if target:
		var desired = target - global_position
		move_and_slide(desired.normalized() * 35)

func set_target(new_target):
	target = new_target

# THIS IS THE LOGIC WHEN ENEMY REACHES THE TOWER
func tower_hit():
	print("YOU SHOULD IMPLEMENT tower_hit FOR -> ", self.name)
