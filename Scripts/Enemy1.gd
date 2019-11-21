extends KinematicBody2D

const EnemyAtack = preload("res://Scenes/EnemyAtack.tscn")

const Ability = preload("res://Scenes/TestAbility.tscn")

export var min_speed = 100
export var max_speed = 200

export var health = 300 setget set_health
export var shoot_speed = 1

var Speed

func _ready():
	randomize()
	$HealthBarEnemy/HealthBar.max_value = health
	add_to_group("enemy")
	Speed = rand_range(min_speed, max_speed)
	
	var atack = EnemyAtack.instance()
	atack.set_enemy_atack_type(1)
	atack.set_enemy_shoot_speed(shoot_speed)
	atack.position = $DeathPos.position
	add_child(atack)
	$HealthBarEnemy.health_setup(health)
	#$EnemyAtackTimer.start()
	#$GunFlashTimer.start()
	#$HealthBarEnemy.health_setup(500)
	$GunFlash1.hide()
	$GunFlash2.hide()
	$GunFlash3.hide()
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass

#func _on_EnemyAtackTimer_timeout():
#	var atack_left = AlternativeAtackLeft.instance()
#	var atack_right = AlternativeAtackRight.instance()
#	var atack = PrimaryAtack.instance()
#	
#	get_parent().get_parent().add_child(atack_left)
#	get_parent().get_parent().add_child(atack_right)
#	get_parent().get_parent().add_child(atack)
#	atack.position = $EnemyPos.global_position
#	atack_left.position = $EnemyPos.global_position
#	atack_right.position = $EnemyPos.global_position
	#print("atack1.position ", atack1.global_position)
	
#	$GunFlash1.show()
#	$GunFlash2.show()
#	$GunFlash3.show()
#	yield($GunFlashTimer, "timeout")
	
#	$HealthBarEnemy.health_damaged(rand_range(1,100))
#	pass

func _on_HealthBarEnemy_death():
	print("Dead!")
	var ability = Ability.instance()
	get_parent().get_parent().add_child(ability)
	ability.global_position = $DeathPos.global_position
	queue_free()
	pass

func _physics_process(delta):
	move_and_collide(Vector2 (0,Speed * delta))
	pass

func _on_GunFlashTimer_timeout():
	$GunFlash1.hide()
	$GunFlash2.hide()
	$GunFlash3.hide()
	pass

func set_health(new_health):
	health = new_health
	if health <= 0: queue_free()
	pass


func _on_Trigger_area_entered(someone):
	if someone.is_in_group("player"):
		#health -= 50
		$HealthBarEnemy.health_damaged(50)
		#someone.queue_free()
		someone.health -= 50
	pass
