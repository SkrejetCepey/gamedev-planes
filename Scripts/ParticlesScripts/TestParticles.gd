extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Particles2D.emitting=true
	$Particles2D/Particles2D.emitting=true
	$Particles2D/Particles2D2.emitting=true
	$Particles2D/Particles2D3.emitting=true
	#global_position.x = get_viewport().get_visible_rect().size.x/2
	#global_position.y = get_viewport().get_visible_rect().size.y/2
	pass # Replace with function body.
func _process(delta):
	yield(get_tree().create_timer(2), "timeout")
	queue_free()
	#if Input.is_action_just_pressed("ui_up"):
	#	$Particles2D.emitting=true
	#	$Particles2D/Particles2D.emitting=true
	#	$Particles2D/Particles2D2.emitting=true
	#	$Particles2D/Particles2D3.emitting=true
	pass

