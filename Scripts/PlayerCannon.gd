extends Node2D

const Bullet = preload("res://scenes/PlayerProjectileBullet.tscn")
var projectileNumber setget projectileNumberSet
var upgradeLvl setget upgradeLvlSet
var firerate = 0.3

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
	bullet.position = pos
	bullet.setSpeed(rot)
	get_node("../").add_child(bullet)
	pass

func projectileNumberSet(number):
	projectileNumber = number
	pass
	
func upgradeLvlSet(number):
	upgradeLvl = number
	pass