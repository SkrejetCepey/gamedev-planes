extends Node2D

const Bullet = preload("res://Scenes/PlayerProjectileBullet.tscn")
var projectileNumber = 1 setget projectileNumberSet
var upgradeLvl = 0 setget upgradeLvlSet
var firerate = 0.3
var target

func _physics_process(delta):
	var motion
	motion = (global_position - target.global_position) * 0.001
	translate(motion)
	pass

func setTarget(pos):
	target = pos
	pass

func _ready():
	var fireTimer = Timer.new()
	fireTimer.set_wait_time(firerate)
	fireTimer.connect("timeout", self, "shoot")
	add_child(fireTimer)
	fireTimer.start()
	pass

func shoot():
	if upgradeLvl == 0:
		createBulletArray(Vector2(0, -20))
	else:
		createBulletArray(Vector2(-10, -20))
		createBulletArray(Vector2(0, -20))
		createBulletArray(Vector2(10, -20))
	pass

func createBulletArray(rot):
	if projectileNumber == 1:
		addBullet(position, rot)
	elif projectileNumber == 2:
		addBullet(Vector2(position.x - 10, position.y), rot)
		addBullet(Vector2(position.x + 10, position.y), rot)
	elif projectileNumber == 3:
		addBullet(Vector2(position.x - 15, position.y), rot)
		addBullet(position, rot)
		addBullet(Vector2(position.x + 15, position.y), rot)
	pass

func addBullet(pos, rot):
	var bullet = Bullet.instance()
	bullet.global_position = global_position
	bullet.setSpeed(rot)
	get_tree().get_root().get_node("ArcadeScene").add_child(bullet)
	pass

func projectileNumberSet(number):
	projectileNumber = number
	pass

func upgradeLvlSet(number):
	upgradeLvl = number
	pass