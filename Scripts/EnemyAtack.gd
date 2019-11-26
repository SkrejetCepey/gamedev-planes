extends Node2D

const Bullet = preload("res://Scenes/Bullet.tscn")

var EnemyAtackType setget set_enemy_atack_type
var EnemyShootSpeed setget set_enemy_shoot_speed
var pos

func _ready():
	add_to_group("enemy")
	$GunFlash.hide()
	
	var fireTimer = Timer.new()
	fireTimer.set_wait_time(EnemyShootSpeed)
	fireTimer.connect("timeout", self, "shoot")
	add_child(fireTimer)
	fireTimer.start()
	pass

func shoot():
	$GunFlash.show()
	position = pos
	if EnemyAtackType == 0:
		var bullet = Bullet.instance()
		bullet.initialize(global_position,Vector2(0,1),180,800,50,"player", false)
		get_parent().get_parent().get_parent().add_child(bullet)
	if EnemyAtackType == 1:
		var bullet_left = Bullet.instance()
		bullet_left.initialize(Vector2(global_position.x,global_position.y),Vector2(-0.35,1),210,800,50,"player",false)
		get_parent().get_parent().get_parent().add_child(bullet_left)
	if EnemyAtackType == 2:
		var bullet_right = Bullet.instance()
		bullet_right.initialize(Vector2(global_position.x,global_position.y),Vector2(0.35,1),150,800,50,"player",false)
		get_parent().get_parent().get_parent().add_child(bullet_right)
	if EnemyAtackType == 3:
		var autobullet = Bullet.instance()
		if(!get_parent().get_parent().get_parent().get_parent().get_node("Player")):
			autobullet.initialize(Vector2(global_position.x,global_position.y),Vector2(0,1),150,800,50,"player",false)
			get_parent().get_parent().get_parent().add_child(autobullet)
			return
		autobullet.initialize(Vector2(global_position.x,global_position.y),get_parent().get_parent().get_parent().get_parent().get_node("Player").global_position,180,800,50,"player",true)
		get_parent().get_parent().get_parent().add_child(autobullet)
		#print("PULYA ", autobullet.global_position)
	yield(get_tree().create_timer(0.14), "timeout")
	$GunFlash.hide()
	pass

func set_enemy_atack_type(atack_type):
	EnemyAtackType = atack_type
	pass

func set_enemy_shoot_speed(shoot_speed):
	EnemyShootSpeed = shoot_speed
	pass

func initialize(_atack_type, _shoot_speed, _pos):
	EnemyAtackType=_atack_type
	EnemyShootSpeed=_shoot_speed
	if (_pos==null): pos=position
	else: pos=_pos
	pass