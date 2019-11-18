extends Node2D

const Bullet = preload("res://Scenes/PrimaryAtack.tscn")

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
		add_bullet(Vector2(position.x, position.y), 500, 0, 0)
	if EnemyAtackType == 1:
		add_bullet(Vector2(position.x - 10, position.y), 500, PI/6, -0.25)
		add_bullet(Vector2(position.x, position.y), 500, 0, 0)
		add_bullet(Vector2(position.x + 10, position.y), 500, - PI/6, 0.25)
	pass

func add_bullet(pos, speed, rot, line):
	var bullet = Bullet.instance()
	bullet.global_position = pos
	bullet.rotate(rot)
	bullet.set_line_atack(line)
	bullet.set_speed(speed)
	get_node("../").add_child(bullet)
	pass
	
func set_enemy_atack_type(atack_type):
	EnemyAtackType = atack_type
	pass

func set_enemy_shoot_speed(shoot_speed):
	EnemyShootSpeed = shoot_speed
	pass
