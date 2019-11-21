extends Area2D

const Rocket = preload("res://Scenes/PlayerProjectileRocket.tscn")
const Maingun = preload("res://Scenes/PlayerCannon.tscn")

func _ready():
	add_to_group("player")
	pass 