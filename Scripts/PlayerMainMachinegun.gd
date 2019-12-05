extends Node2D

const Bullet = preload("res://Scenes/Bullet.tscn")
var projectileNumber = 0 setget projectileNumberSet
var upgradeLvl = 0 setget upgradeLvlSet
var firerate = 0.3
var bulletSpeed = 800

func _ready():
	var fireTimer = Timer.new()
	fireTimer.set_wait_time(firerate)
	fireTimer.connect("timeout", self, "shoot")
	add_child(fireTimer)
	fireTimer.start()
	pass

func shoot():
	var x = global_position.x
	var y = global_position.y
	if upgradeLvl == 0:
		createBulletArray(Vector2(x, y), Vector2(0, -1), 0)
	else:
		createBulletArray(Vector2(x - 30, y + 10), Vector2(-0.5, -1), 315)
		createBulletArray(Vector2(x, y), Vector2(0, -1), 0)
		createBulletArray(Vector2(x + 30, y + 10), Vector2(0.5, -1), 45)
	pass

func createBulletArray(pos, dir, rot):
	if projectileNumber == 0:
		addBullet(pos, dir, rot)
	elif projectileNumber == 1:
		pos.x - 20
		addBullet(pos, dir,  rot)
		pos.x + 20
		addBullet(pos, dir,  rot)
	elif projectileNumber == 2:
		addBullet(pos, dir,  rot)
		pos.x - 15
		addBullet(pos, dir,  rot)
		pos.x + 30
		addBullet(pos, dir,  rot)
	pass

func addBullet(pos, dir, rot):
	var bullet = Bullet.instance()
	bullet.initialize(pos, dir, bulletSpeed, 50, "enemy", false)
	#get_tree().get_root().get_node("ArcadeScene").add_child(bullet)
	get_parent().get_parent().add_child(bullet)
	pass

func projectileNumberSet(number):
	projectileNumber = number
	pass

func upgradeLvlSet(number):
	upgradeLvl = number
	pass