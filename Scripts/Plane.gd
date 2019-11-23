extends Area2D

const Rocket = preload("res://Scenes/PlayerProjectileRocket.tscn")
const Maingun = preload("res://Scenes/PlayerCannon.tscn")
var health = 150 

func _ready():
	add_to_group("player")
	pass 

func _physics_process(delta):
	#print(health)
	if health <= 0:
		get_parent().self_destruct()
	pass