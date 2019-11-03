extends Area2D

func start(pos):
	set_global_position(pos)
	pass

func _physics_process(delta):
	var speed = 10
	position.y -= speed
	pass

func _on_Area2D_area_entered(other):
	if other.is_in_group("enemy"):
		other.health -= 1
		queue_free()
	pass

func _on_ProjectileVisibility_screen_exited():
	queue_free()
	pass
