extends Node2D

func _ready():
	$AnimationPlayer.play("BossEvent")
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass 
