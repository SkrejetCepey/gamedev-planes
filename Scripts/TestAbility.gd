extends RigidBody2D

export var speed = 100
var velocity = Vector2()

func _physics_process(delta):
	if(position.y > get_viewport().get_visible_rect().size.y + 10):
		queue_free()
	#global_position.x = clamp(global_position.x, 0, get_viewport_rect().size.x)
	#velocity.x = speed * delta * 2
	#velocity.y = speed * delta
	#translate(velocity)
	pass
	
func _ready():
	add_to_group("ability")
	print(rand_range(0, 2))
	if(rand_range(0, 2) < 1):
		linear_velocity.x = 100
	else:
		linear_velocity.x= -100
	pass

func _on_Visible_screen_exited():
	#if (get_parent().get_parent()):
	#get_parent().get_parent().queue_free()
	queue_free()
	print("CLEAR ABILITY")
	pass 
