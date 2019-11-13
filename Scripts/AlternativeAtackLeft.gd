extends Area2D

export var speed = 500
var velocity = Vector2()

func _physics_process(delta):
	velocity.x = speed * delta * (-0.25)
	velocity.y = speed * delta 
	translate(velocity)
	pass
	
func _ready():
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass 