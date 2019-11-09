extends RigidBody2D

const PrimaryAtack = preload("res://Scenes/PrimaryAtack.tscn")
const AlternativeAtack = preload("res://Scenes/AlternativeAtack.tscn")
const Ability = preload("res://Scenes/PathAbilityTest.tscn")

export var min_speed = 100
export var max_speed = 200

func _ready():
	randomize()
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
	get_parent().add_child(atack)
	#add_child(atack)
	atack.position = $DeathPos.global_position
	
	var atack1 = AlternativeAtack.instance()
	#add_child(atack1)
	get_parent().add_child(atack1)
	atack1.position = $EnemyPos.global_position
	
	$GunFlash1.show()
	$GunFlash2.show()
	$GunFlash3.show()
	#$GunFlash.hide()
	yield($GunFlashTimer, "timeout")
	
	$HealthBarEnemy.health_damaged(rand_range(1,100))
	pass

func _on_HealthBarEnemy_death():
	print("Dead!")
	var ability = Ability.instance()
	get_parent().add_child(ability)
	ability.global_position = $DeathPos.global_position
	queue_free()
	pass

func _on_GunFlashTimer_timeout():
	$GunFlash1.hide()
	$GunFlash2.hide()
	$GunFlash3.hide()
	pass
