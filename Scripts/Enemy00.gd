extends RigidBody2D

export var min_speed = 150
export var max_speed = 250

func _ready():
	pass 

func _on_start_game():
	queue_free()

func _on_Visible_screen_exited():
	queue_free()
	pass
