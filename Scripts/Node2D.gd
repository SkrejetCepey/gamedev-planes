extends Node2D
const bullet = preload("res://Scenes/Bullet.tscn")
const Player = preload("res://Scenes/Player.tscn")
func _ready():
	var bull = bullet.instance()
	add_child(bull)
	bull.initialize(Vector2(100,100),Vector2(0,1),180,300,500)
	var bull1 = bullet.instance()
	add_child(bull1)
	bull1.initialize(Vector2(200,100),Vector2(0,1),180,300,800)
	var pl = Player.instance()
	add_child(pl)
	pass