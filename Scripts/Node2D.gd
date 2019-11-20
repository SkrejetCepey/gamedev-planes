extends Node2D
const bullet = preload("res://Scenes/Bullet.tscn")
const Player = preload("res://Scenes/Player.tscn")
func _ready():
	var bull = bullet.instance()
	add_child(bull)
	bull.initialize(Vector2(100,100),Vector2(0,1),180,300,500)
	pass