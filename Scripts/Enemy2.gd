extends KinematicBody2D

const EnemyAtack = preload("res://Scenes/EnemyAtack.tscn")
const DeathHandler = preload("res://Scenes/EnemyDeathHandler.tscn")

export var health = 150 setget set_health
export var shoot_speed = 0.5
export var speed = 250
export var atack_type = 3

func _ready():
	add_to_group("enemy")
	
	var atack = EnemyAtack.instance()
	atack.initialize(atack_type, shoot_speed, null)
	$DeathPos.add_child(atack)
	$HealthBarEnemy.health_setup(health)
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass

func _on_HealthBarEnemy_death():
	var death_handler = DeathHandler.instance()
	#var ability = Ability.instance()
	var dic_boosts = ["Repairkit", "Speedboost", "Shield"]
	var dic_chance = [0.1, 0.1, 0.5]
	
	death_handler.ability_initialize(dic_boosts, dic_chance, $DeathPos.global_position)
	get_parent().get_parent().add_child(death_handler)
	#ability.initialize(dictionary, dic_chance, "ability")
	#ability.global_position = $DeathPos.global_position
	#get_parent().get_parent().add_child(ability)
	
	$Trigger.get_node("CollisionShape2D2").set_deferred("disabled", true)
	
	queue_free()
	pass

func _process(delta):
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
		set_damage(500)
		someone.health -= 50
	pass