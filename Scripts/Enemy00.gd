extends RigidBody2D

const PrimaryAtack = preload("res://Scenes/PrimaryAtack.tscn")

export var min_speed = 150
export var max_speed = 250

func _ready():
	$EnemyAtackTimer.start()
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass

func _on_EnemyAtackTimer_timeout():
	var atack = PrimaryAtack.instance()
	add_child(atack)
	atack.position = $EnemyPos.position
	pass
