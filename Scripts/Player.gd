extends Area2D

const Bullet = preload("res://scenes/PlayerProjectileBullet.tscn")
const Rocket = preload("res://Scenes/PlayerProjectileRocket.tscn")
const Canon = preload("res://Scenes/PlayerCannon.tscn")

var prevMousePos = null
var health = 3 setget set_health
var speed = 0.2
var gunFirerate = 0.2
var bulletNumber = 2
var rocketFirerate = 0.7

func _physics_process(delta):
	moving()
	pass

func _ready():
	add_to_group("player")
	position.y = 550
	position.x = 250
	var canon = Canon.instance()
	canon.position = $PlayerCannonPosition.position
	canon.projectileNumberSet(1)
	canon.upgradeLvlSet(1)
	add_child(canon)
	pass

func moving():
	var currentMousePos = get_global_mouse_position()
	var motion
	if Input.is_action_pressed("player_move"):
		if prevMousePos == null:
			prevMousePos = get_global_mouse_position()
		motion = (currentMousePos - prevMousePos) * speed
		translate(motion)
		prevMousePos = prevMousePos + motion
	elif Input.is_action_just_released("player_move"):
		prevMousePos = null
	pass

func set_health(new_value):
	health = new_value
	if health <= 0: queue_free()
	pass