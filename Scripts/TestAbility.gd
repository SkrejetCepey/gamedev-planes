extends Area2D

export var speed = 100
var velocity = Vector2()

func _physics_process(delta):
	global_position.x = clamp(global_position.x, 0, get_viewport_rect().size.x)
	velocity.y = speed * delta
	translate(velocity)
	pass
	
func _ready():
	pass

func _on_Visible_screen_exited():
	if (get_parent().get_parent()):
		get_parent().get_parent().queue_free()
	pass 