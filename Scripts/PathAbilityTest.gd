extends Path2D

export var speed = 100

onready var follow = get_node("PathFollow2D")

func _process(delta):
	follow.set_offset(follow.get_offset() + speed * delta)
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
