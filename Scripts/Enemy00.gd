extends RigidBody2D

const PrimaryAtack = preload("res://Scenes/PrimaryAtack.tscn")
const AlternativeAtack = preload("res://Scenes/AlternativeAtack.tscn")

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
	
	var atack1 = AlternativeAtack.instance()
	add_child(atack1)
	atack.position = $EnemyPos.position
	
	$HealthBarEnemy.health_damaged(rand_range(1, 100))
	pass


func _on_HealthBarEnemy_death():
	queue_free()
	pass # Replace with function body.
