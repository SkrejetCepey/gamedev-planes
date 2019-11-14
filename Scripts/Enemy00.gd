extends KinematicBody2D

const PrimaryAtack = preload("res://Scenes/PrimaryAtack.tscn")
const Ability = preload("res://Scenes/TestAbility.tscn")

export var min_speed = 150
export var max_speed = 250

var Speed

func _ready():
	randomize()
	Speed = rand_range(min_speed, max_speed)
	#move_and_slide(Vector2 (rand_range(mob.min_speed, mob.max_speed))
	add_to_group("enemy")
	$EnemyAtackTimer.start()
	$GunFlashTimer.start()
	$HealthBarEnemy.health_setup(100)
	$GunFlash.hide()
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass

func _on_EnemyAtackTimer_timeout():
	var atack = PrimaryAtack.instance()
	get_parent().get_parent().add_child(atack)
	#print($DeathPos.get_parent().name)
	atack.position = $DeathPos.global_position
	$GunFlash.show()
	yield($GunFlashTimer, "timeout")
	
	#var atack1 = AlternativeAtack.instance()
	#add_child(atack1)
	#atack.position = $EnemyPos.position
	
	#$HealthBarEnemy.health_damaged(rand_range(1,100))
	pass

func _on_HealthBarEnemy_death():
	print("Dead!")
	var ability = Ability.instance()
	get_parent().get_parent().add_child(ability)
	ability.global_position = $DeathPos.global_position
	queue_free()
	pass

func _process(delta):
	move_and_collide(Vector2 (0,Speed * delta))
	pass

func _on_GunFlashTimer_timeout():
	$GunFlash.hide()
	pass
