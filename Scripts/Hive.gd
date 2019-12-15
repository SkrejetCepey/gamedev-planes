extends KinematicBody2D

const BossAtack = preload("res://Scenes/BossAtack.tscn")
const DeathHandler = preload("res://Scenes/EnemyDeathHandler.tscn")

export var health = 1000 setget set_health
export var shoot_speed = 5
export var speed = 10
export var atack_type = 4

var stage = 0

var typical_counter=5

func _ready():
	add_to_group("enemy")
	$AnimationPlayer.play("Hive")
	$AnimationPlayer.queue("HiveMoving")
	get_parent().get_node("BossEvent").queue_free()
	
	var audio_file = "res://Music/Other/boss.wav"
	
	if File.new().file_exists(audio_file):
		var sfx = load(audio_file)
		#sfx.set_loop(false)
		get_node("/root/SoundHandler").get_child(0).stream = sfx
		get_node("/root/SoundHandler").get_child(0).play()
	
	set_process(false)
	yield(get_tree().create_timer(3), "timeout")
	set_process(true)
	
	var fireTimer = Timer.new()
	fireTimer.set_wait_time(shoot_speed)
	fireTimer.connect("timeout", self, "shoot")
	add_child(fireTimer)
	fireTimer.start()
	
	for i in range(12):
		var atack = BossAtack.instance()
		atack.initialize(atack_type, shoot_speed, null)
		get_node(str(i)+"cannon").add_child(atack)
		
		#var atack_suicide = BossAtack.instance()
		#atack_suicide.initialize(5, shoot_speed, null)
		#get_node(str(i)+"cannon").add_child(atack_suicide)
	#$DeathPos.add_child(atack)
	$HealthBarEnemy.health_setup(health)
	pass 

func shoot():
	randomize()
	var temp = str(round(rand_range(0, 11)))+"cannon"
	
	if(get_parent().get_parent().get_node_or_null("Player")==null):
		return
	if(get_parent().get_node_or_null("EnemySniperDrone")==null):
		#get_node(temp).get_node("BossAtack").set_enemy_atack_type(4)
		get_node(temp).get_node("BossAtack").initialize(atack_type, shoot_speed, null)
		get_node(temp).get_node("BossAtack").shoot()
		if(typical_counter>0): typical_counter-=1
		#if(typical_counter==0): 
		#	$Shield.queue_free()
		#	typical_counter-=1
		#	return
	#if(get_parent().get_node_or_null("EnemySuicideDrone")==null):
		#atack.set_enemy_atack_type(5)
	#get_node(temp).get_node("BossAtack").set_enemy_atack_type(5)
	get_node(temp).get_node("BossAtack").initialize(5, 1, null)
	get_node(temp).get_node("BossAtack").shoot()
	#if(typical_counter>0): typical_counter-=1
	if(typical_counter==0): 
		$Shield.queue_free()
		typical_counter-=1
		return
	#if(get_parent().get_node_or_null("EnemySuicideDrone")==null):
		#get_node(str(round(rand_range(0, 11)))+"cannon").get_node("BossAtack").shoot()
	pass

func _on_HealthBarEnemy_death():
	#var explosion = Explosion.instance()
	#explosion.global_position = $DeathPos.global_position
	#get_parent().add_child(explosion)
	#var ability = Ability.instance()
	#var death_handler = DeathHandler.instance()
	#var dic_boosts = ["Repairkit", "Speedboost", "Shield"]
	#var dic_chance = [0.5, 0.4, 0.1]
	
	#death_handler.ability_initialize(dic_boosts, dic_chance, $DeathPos.global_position)
	#get_parent().get_parent().add_child(death_handler)
	
	#ability.initialize(dic_boosts, dic_chance, "ability")
	#ability.global_position = $DeathPos.global_position
	#get_parent().get_parent().add_child(ability)
	
	#var cash = Ability.instance()
	#var dictionary_cash = ["low_cash", "medium_cash", "large_cash"]
	#var dic_chance_cash = [0.5, 0.4, 0.1]
	#cash.initialize(dictionary_cash, dic_chance_cash, "cash")
	#cash.global_position = $DeathPos.global_position
	#get_parent().get_parent().add_child(cash)
	#get_parent().get_parent().get_node("EnemySpawnTimer").set_wait_timer(get_parent().get_parent().get_node("EnemySpawnTimer").get_wait_time() - 0.5)
	
	$Trigger.get_node("CollisionShape2D2").set_deferred("disabled", true)
	
	var delay = get_parent().get_parent().get_node("EnemySpawnTimer").get_wait_time()
	if delay > 0.5:
		delay -= 0.5
		get_parent().get_parent().get_node("EnemySpawnTimer").set_wait_time(delay)
	queue_free()
	pass

func _process(delta):
	if(get_parent().get_parent().get_node_or_null("Player")==null):
		$AnimationPlayer.stop()
		speed = 200
		move_and_collide(Vector2 (0,speed * delta))
		return
	#move_and_collide(Vector2 (0,speed * delta))
	if(position.x > get_viewport_rect().size.x * 3/4 || position.x < get_viewport_rect().size.x * 1/4):
		speed=-speed
	move_and_collide(Vector2 (speed * delta,0))
	pass

func set_damage(damage):
	if (get_node_or_null("Shield")==null):
		health -= damage
		$HealthBarEnemy/HealthBar.value = health
		$HealthBarEnemy.health_damaged(damage)
	pass

func set_health(new_health):
	health = new_health
	$HealthBarEnemy.health_setup(new_health)
	pass

func _on_Trigger_area_entered(someone):
	if someone.is_in_group("player"):
		#set_damage(100)
		someone.get_damaged(50)
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass
