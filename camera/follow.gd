extends Camera2D

export(NodePath) var targetPath
export var bounds = 50.0

var target

func _ready():
	if targetPath:
		target = get_node(targetPath)
	
func _physics_process(delta):
	if target:
		var rDist = self.position.x - target.position.x
		
		if rDist < bounds:
			self.position.x = target.position.x
