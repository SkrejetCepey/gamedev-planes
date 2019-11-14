extends Area2D

export var speed = 500
var velocity = Vector2()

func _physics_process(delta):
	if(position.y > get_viewport().get_visible_rect().size.y + 10):
		queue_free()
	velocity.y = speed * delta
	translate(velocity)
	pass
	
func _ready():
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass 
