tool
extends Node2D

# EXPORTS
####

export(PackedScene) var whatToSpawn
export(int) var interval
export(int) var spawnCount = 1
export(float) var radius setget do_update

# VARIABLES
####

var time

# OVERRIDES
####

func _ready():
	if Engine.editor_hint:
		return
		
	time = interval

func _process(delta):
	if Engine.editor_hint:
		return
	
	if time:
		time -= delta
		
		if time <= 0:
			time = interval
			spawn()

# USER DEFINED
####

func spawn():
	for _i in spawnCount:
		var entity = whatToSpawn.instance()
		var pos = get_random_point_in_radius()
		entity.set_position(pos)
		add_child(entity)

func get_random_point_in_radius():
	var x = cos(rand_range(0, 2*PI))
	var y = sin(rand_range(0, 2*PI))
	return Vector2(x * rand_range(5, radius), y * rand_range(5, radius))

# EDITOR ONLY
####
func do_update(new_val):
	radius = new_val
	if Engine.editor_hint:
		update()

func _draw():
	if Engine.editor_hint:
		draw_circle(Vector2(0, 0), radius, Color(0.901, 0.360, 0.364, 0.5))



