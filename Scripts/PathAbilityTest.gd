extends Path2D

export var speed = 100
#var screen_size

onready var follow = get_node("PathFollow2D")

func _process(delta):
	follow.set_offset(follow.get_offset() + speed * delta)
	#follow.move_local_x = clamp(follow.move_local_x, 0, screen_size.x)
	#follow.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	#set_process(true)
	#screen_size = get_viewport_rect().size
	pass
