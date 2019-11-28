extends Node2D

const Bullet = preload("res://Scenes/Bullet.tscn")
var projectileNumber = 1 setget projectileNumberSet
var upgradeLvl = 0 setget upgradeLvlSet
var firerate = 0.3
var target

func _physics_process(delta):
	var motion
	motion = (target.global_position - global_position) * 0.35
	translate(motion)
	pass

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
	var pos = Vector2(x, y)
	var dir = Vector2(0, -1)
	if projectileNumber == 0:
		addBullet(pos, dir, 0)
	elif projectileNumber == 1:
		pos.x - 100
		addBullet(pos, dir, 0)
		pos.x + 20
		addBullet(pos, dir, 0)
	elif projectileNumber == 2:
		addBullet(pos, dir, 0)
		pos.x - 15
		addBullet(pos, dir, 0)
		pos.x + 30
		addBullet(pos, dir, 0)
	pass

func addBullet(pos, dir, rot):
	var bullet = Bullet.instance()
	bullet.initialize(pos, dir, 800, 10, "enemy", false) 
	get_tree().get_root().get_node("ArcadeScene").add_child(bullet)
	pass

func projectileNumberSet(number):
	projectileNumber = number
	pass

func upgradeLvlSet(number):
	upgradeLvl = number
	pass

func setTarget(pos):
	target = pos
	pass