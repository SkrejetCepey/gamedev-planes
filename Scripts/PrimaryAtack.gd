extends Area2D

var speed setget set_speed#for test
var line_atack setget set_line_atack

var velocity = Vector2()

func _physics_process(delta):
	if(position.y > get_viewport().get_visible_rect().size.y + 10):
		queue_free()
	velocity.y = speed * delta
	velocity.x = speed * delta * line_atack
	translate(velocity)
	pass
	
func _ready():
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass 

func set_speed(new_speed):
	speed = new_speed
	pass

func _on_Trigger_area_entered(someone):
	if someone.is_in_group("player"):
		someone.health -= 1
		queue_free()
	pass 
	
func set_line_atack(line):
	line_atack = line
	pass