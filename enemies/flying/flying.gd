extends "res://enemies/enemy_base.gd"

func singleton():
	var memo = get_node("/root/Memory")
	
	if not memo.memory.has("flying_tower_count"):
		memo.memory["flying_tower_count"] = []
	
	return memo

func incr_count():
	var memo = singleton()
	memo.memory["flying_tower_count"].append(self)

func tower_hit():
	$Animation.play("angry")
	target = null
	collision_layer = 0
	collision_mask = 0
	
	incr_count()
	
	if singleton().memory["flying_tower_count"].size() >= 3:
		var popout = []
		for _i in 3:
			var item = singleton().memory["flying_tower_count"].pop_front()
			item.find_node("Animation").play("dying")
			popout.append(item)
			
		

