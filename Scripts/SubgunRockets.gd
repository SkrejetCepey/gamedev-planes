extends Node2D

const Rocket = preload("res://Scenes/PlayerProjectileRocket.tscn")
var projectileNumber = 1 setget projectileNumberSet
var upgradeLvl = 0 setget upgradeLvlSet
var firerate = 1 setget firerateSet

func _ready():
	var fireTimer = Timer.new()
	fireTimer.set_wait_time(firerate)
	fireTimer.connect("timeout", self, "shoot")
	add_child(fireTimer)
	fireTimer.start()
	pass

func shoot():
	if upgradeLvl == 0:
		createBulletArray(Vector2(0, -10))
	else:
		createBulletArray(Vector2(-10, -10))
		createBulletArray(Vector2(0, -10))
		createBulletArray(Vector2(10, -10))
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
	var rocket = Rocket.instance()
	rocket.global_position = global_position
	rocket.setSpeed(rot)
	get_tree().get_root().get_node("ArcadeScene").add_child(rocket)
	pass

func projectileNumberSet(number):
	projectileNumber = number
	pass

func upgradeLvlSet(number):
	upgradeLvl = number
	pass
	
func firerateSet(number):
	firerate = number
	pass