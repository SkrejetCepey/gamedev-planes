extends Node2D

const Bullet = preload("res://Scenes/Bullet.tscn")

var EnemyAtackType setget set_enemy_atack_type
var EnemyShootSpeed setget set_enemy_shoot_speed

func _ready():
	add_to_group("enemy")
	
	var fireTimer = Timer.new()
	fireTimer.set_wait_time(EnemyShootSpeed)
	fireTimer.connect("timeout", self, "shoot")
	add_child(fireTimer)
	fireTimer.start()
	pass

func shoot():
	if EnemyAtackType == 0:
		var bullet = Bullet.instance()
		bullet.initialize(global_position,Vector2(0,1),180,800,50,"player")
		get_parent().get_parent().get_parent().add_child(bullet)
	if EnemyAtackType == 1:
		var bullet_left = Bullet.instance()
		bullet_left.initialize(Vector2(global_position.x,global_position.y),Vector2(-0.35,1),210,800,50,"player")
		get_parent().get_parent().get_parent().add_child(bullet_left)
	if EnemyAtackType == 2:
		var bullet_right = Bullet.instance()
		bullet_right.initialize(Vector2(global_position.x,global_position.y),Vector2(0.35,1),150,800,50,"player")
		get_parent().get_parent().get_parent().add_child(bullet_right)
	pass

func set_enemy_atack_type(atack_type):
	EnemyAtackType = atack_type
	pass

func set_enemy_shoot_speed(shoot_speed):
	EnemyShootSpeed = shoot_speed
	pass

func initialize(_atack_type, _shoot_speed):
	EnemyAtackType=_atack_type
	EnemyShootSpeed=_shoot_speed
	pass
