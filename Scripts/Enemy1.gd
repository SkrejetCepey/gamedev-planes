extends KinematicBody2D

const EnemyAtack = preload("res://Scenes/EnemyAtack.tscn")
const DeathHandler = preload("res://Scenes/EnemyDeathHandler.tscn")

export var health = 150 setget set_health
export var shoot_speed = 1
export var speed = 200

func _ready():
	add_to_group("enemy")
	
	var atack_left = EnemyAtack.instance()
	atack_left.initialize(1, shoot_speed, null)
	$LeftCannon.add_child(atack_left)
	
	var atack_right = EnemyAtack.instance()
	atack_right.initialize(2, shoot_speed, null)
	$RightCannon.add_child(atack_right)
	
	var atack = EnemyAtack.instance()
	atack.initialize(0, shoot_speed, null)
	$DeathPos.add_child(atack)
	
	$HealthBarEnemy.health_setup(health)
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass

func _on_HealthBarEnemy_death():
	#var ability = Ability.instance()
	var death_handler = DeathHandler.instance()
	
	var dic_boosts = ["Repairkit", "Speedboost", "Shield"]
	var dic_chance = [0.5, 0.4, 0.1]
	#ability.initialize(dictionary, dic_chance, "ability")
	#ability.global_position = $DeathPos.global_position
	#get_parent().get_parent().add_child(ability)
	death_handler.ability_initialize(dic_boosts, dic_chance, $DeathPos.global_position)
	get_parent().get_parent().add_child(death_handler)
	#var cash = Ability.instance()
	#var dictionary_cash = ["low_cash", "medium_cash", "large_cash"]
	#var dic_chance_cash = [0.5, 0.4, 0.1]
	#cash.initialize(dictionary_cash, dic_chance_cash, "cash")
	#cash.global_position = $DeathPos.global_position
	#get_parent().get_parent().add_child(cash)
	
	queue_free()
	pass

func _physics_process(delta):
	move_and_collide(Vector2 (0,speed * delta))
	pass

func set_damage(damage):
	health -= damage
	$HealthBarEnemy/HealthBar.value = health
	$HealthBarEnemy.health_damaged(damage)
	pass

func set_health(new_health):
	health = new_health
	$HealthBarEnemy.health_setup(health)
	pass

func _on_Trigger_area_entered(someone):
	if someone.is_in_group("player"):
		set_damage(300)
		someone.health -= 100
	pass
