extends KinematicBody2D

const PrimaryAtack = preload("res://Scenes/PrimaryAtack.tscn")

#const AlternativeAtack = preload("res://Scenes/AlternativeAtack.tscn")
const AlternativeAtackLeft = preload("res://Scenes/AlternativeAtackLeft.tscn")
const AlternativeAtackRight = preload("res://Scenes/AlternativeAtackRight.tscn")

const Ability = preload("res://Scenes/TestAbility.tscn")

export var min_speed = 100
export var max_speed = 200

var Speed

func _ready():
	randomize()
	Speed = rand_range(min_speed, max_speed)
	
	add_to_group("enemy")
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
	var atack_left = AlternativeAtackLeft.instance()
	var atack_right = AlternativeAtackRight.instance()
	var atack = PrimaryAtack.instance()
	
	get_parent().get_parent().add_child(atack_left)
	get_parent().get_parent().add_child(atack_right)
	get_parent().get_parent().add_child(atack)
	atack.position = $EnemyPos.global_position
	atack_left.position = $EnemyPos.global_position
	atack_right.position = $EnemyPos.global_position
	#print("atack1.position ", atack1.global_position)
	
	$GunFlash1.show()
	$GunFlash2.show()
	$GunFlash3.show()
	yield($GunFlashTimer, "timeout")
	
	$HealthBarEnemy.health_damaged(rand_range(1,100))
	pass

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
