extends RigidBody2D

const PrimaryAtack = preload("res://Scenes/PrimaryAtack.tscn")
const AlternativeAtack = preload("res://Scenes/AlternativeAtack.tscn")

export var min_speed = 100
export var max_speed = 200

func _ready():
	$EnemyAtackTimer.start()
	$GunFlashTimer.start()
	$HealthBarEnemy.health_setup(500)
	$GunFlash1.hide()
	$GunFlash2.hide()
	$GunFlash3.hide()
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
	
	$GunFlash1.show()
	$GunFlash2.show()
	$GunFlash3.show()
	#$GunFlash.hide()
	yield($GunFlashTimer, "timeout")
	
	$HealthBarEnemy.health_damaged(rand_range(1,100))
	pass

func _on_HealthBarEnemy_death():
	print("Dead!")
	queue_free()
	pass

func _on_GunFlashTimer_timeout():
	$GunFlash1.hide()
	$GunFlash2.hide()
	$GunFlash3.hide()
	pass
