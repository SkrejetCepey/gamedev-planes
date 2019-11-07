extends Area2D

export var speed = 100
var velocity = Vector2()

func _physics_process(delta):
	#velocity.y = speed * delta
	#translate(velocity)
	pass
	
func _ready():
	pass

func _on_Visible_screen_exited():
	get_parent().get_parent().queue_free()
	pass 