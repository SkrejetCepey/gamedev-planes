extends Node2D

func _ready():
	$Particles2D.emitting=true
	$Particles2D/Particles2D.emitting=true
	$Particles2D/Particles2D2.emitting=true
	$Particles2D/Particles2D3.emitting=true
	
	yield(get_tree().create_timer(2), "timeout")
	queue_free()
	#global_position.x = get_viewport().get_visible_rect().size.x/2
	#global_position.y = get_viewport().get_visible_rect().size.y/2
	pass

