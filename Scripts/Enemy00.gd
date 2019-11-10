extends RigidBody2D

const PrimaryAtack = preload("res://Scenes/PrimaryAtack.tscn")
const Ability = preload("res://Scenes/PathAbilityTest.tscn")
#const AlternativeAtack = preload("res://Scenes/AlternativeAtack.tscn")

export var min_speed = 150
export var max_speed = 250

func _ready():
	randomize()
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
	get_parent().add_child(atack)
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
	get_parent().add_child(ability)
	ability.global_position = $DeathPos.global_position
	queue_free()
	pass


func _on_GunFlashTimer_timeout():
	$GunFlash.hide()
	pass
