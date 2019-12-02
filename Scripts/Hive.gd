extends KinematicBody2D

const BossAtack = preload("res://Scenes/BossAtack.tscn")
const DeathHandler = preload("res://Scenes/EnemyDeathHandler.tscn")

export var health = 100 setget set_health
export var shoot_speed = 5
export var speed = 10
export var atack_type = 4

func _ready():
	add_to_group("enemy")
	$AnimationPlayer.play("Hive")
	$AnimationPlayer.queue("HiveMoving")
	get_parent().get_node("BossEvent").queue_free()
	$AudioStreamPlayer2D.play()
	#$AnimationPlayer.play("AnimationEnemyHive")
	
	set_process(false)
	yield(get_tree().create_timer(4), "timeout")
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
	#$DeathPos.add_child(atack)
	pass 

func shoot():
	randomize()
	if(!get_parent().get_parent().get_node("Player")):
		return
	if(!get_parent().get_node("EnemySniperDrone")):
		get_node(str(round(rand_range(0, 11)))+"cannon").get_node("BossAtack").shoot()
	pass

func _process(delta):
	if(!get_parent().get_parent().get_node("Player")):
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
	health -= 0
	#$HealthBarEnemy.health_damaged(0)
	pass

func set_health(new_health):
	health = new_health
	#$HealthBarEnemy.health_setup(new_health)
	pass

func _on_Trigger_area_entered(someone):
	if someone.is_in_group("player"):
		#set_damage(100)
		someone.health -= 50
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass
