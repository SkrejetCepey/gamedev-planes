extends Node2D

const Player = preload("res://Scenes/Player.tscn")
const Enemy = preload("res://Scenes/Enemy0.tscn")

func _ready():
	var player = Player.instance()
	var enemy = Enemy.instance()
	add_child(player)
	enemy.speed = 0
	enemy.set_health(200)
	enemy.global_position.x = 150
	enemy.global_position.y = 150
	add_child(enemy)
