extends KinematicBody2D

const Ability = preload("res://Scenes/AbilitySystem.tscn")
const EnemyAtack = preload("res://Scenes/EnemyAtack.tscn")

export var health = 100 setget set_health
export var shoot_speed = 1
export var speed = 200
export var atack_type = 0

func _ready():
	randomize()
	$HealthBarEnemy/HealthBar.max_value = health
	add_to_group("enemy")
	
	var atack = EnemyAtack.instance()
	atack.set_enemy_atack_type(atack_type)
	atack.set_enemy_shoot_speed(shoot_speed)
	atack.position = $DeathPos.position
	add_child(atack)
	$HealthBarEnemy.health_setup(health)
	$GunFlash.hide()
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass

func _on_HealthBarEnemy_death():
	var ability = Ability.instance()
	var dictionary = ["repairkit", "speedboost", "shield"]
	var dic_chance = [0.5, 0.4, 0.1]
	ability.initialize(dictionary, dic_chance)
	ability.global_position = $DeathPos.global_position
	get_parent().get_parent().add_child(ability)
	queue_free()
	pass

func _process(delta):
	move_and_collide(Vector2 (0,speed * delta))
	pass

func set_damage(damage):
	health -= damage
	pass

func set_health(new_health):
	health = new_health
	$HealthBarEnemy/HealthBar.value = health
	if health <= 0: queue_free()
	pass

func _on_GunFlashTimer_timeout():
	$GunFlash.hide()
	pass

func _on_Trigger_area_entered(someone):
	if someone.is_in_group("player"):
		$HealthBarEnemy.health_damaged(100)
		someone.health -= 50
	pass
