extends KinematicBody2D

const Ability = preload("res://Scenes/TestAbility.tscn")
const EnemyAtack = preload("res://Scenes/EnemyAtack.tscn")

export var min_speed = 150
export var max_speed = 250

export var health = 100 setget set_health
export var shoot_speed = 1

var Speed

func _ready():
	randomize()
	
	add_to_group("enemy")
	Speed = rand_range(min_speed, max_speed)
	var atack = EnemyAtack.instance()
	atack.set_enemy_atack_type(0)
	atack.set_enemy_shoot_speed(shoot_speed)
	atack.position = $DeathPos.position
	add_child(atack)
	
	#get_parent().get_parent().add_child(atack)
	#print($DeathPos.get_parent().name)
	#atack.position = $DeathPos.global_position
	#$GunFlash.show()
	#yield($GunFlashTimer, "timeout")
	#move_and_slide(Vector2 (rand_range(mob.min_speed, mob.max_speed))
	#$EnemyAtackTimer.start()
	
	#$GunFlashTimer.start()
	$HealthBarEnemy.health_setup(health)
	$GunFlash.hide()
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass

#func _on_EnemyAtackTimer_timeout():
#	var atack = PrimaryAtack.instance()
#	atack.set_speed(500)
#	get_parent().get_parent().add_child(atack)
#	#print($DeathPos.get_parent().name)
#	atack.position = $DeathPos.global_position
#	$GunFlash.show()
#	yield($GunFlashTimer, "timeout")
	
	#var atack1 = AlternativeAtack.instance()
	#add_child(atack1)
	#atack.position = $EnemyPos.position
	
	#$HealthBarEnemy.health_damaged(rand_range(1,100))
#	pass

func _on_HealthBarEnemy_death():
	#print("Dead!")
	var ability = Ability.instance()
	get_parent().get_parent().add_child(ability)
	ability.global_position = $DeathPos.global_position
	queue_free()
	pass

func _process(delta):
	move_and_collide(Vector2 (0,Speed * delta))
	pass

func set_health(new_health):
	#$HealthBarEnemy.health_damaged(rand_range(1,100))
	health = new_health
	if health <= 0: queue_free()
	pass

func _on_GunFlashTimer_timeout():
	$GunFlash.hide()
	pass


func _on_Trigger_area_entered(someone):
	if someone.is_in_group("player"):
		#health -= 50
		$HealthBarEnemy.health_damaged(50)
		someone.queue_free()
	pass # Replace with function body.
