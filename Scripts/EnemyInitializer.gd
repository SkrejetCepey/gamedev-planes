extends Node2D

const Enemy0 = preload("res://Scenes/Enemy0.tscn")
const Enemy1 = preload("res://Scenes/Enemy1.tscn")

var enemy_type
var pos

func _ready():
	#if (enemy_type=="Enemy0"):
	#	var enemy = Enemy0.instance()
	#	get_parent().get_parent().add_child(enemy)
	#	enemy.position = pos
	#elif (enemy_type=="Enemy1"):
	#	var enemy = Enemy1.instance()
	#get_parent().add_child(self)
	#enemy.position = pos
	#"res://Sprites/"+ability_type+".png"
	pass 

func initialize(_enemy_type, _pos):
	enemy_type=_enemy_type
	pos = _pos
	if (enemy_type=="Enemy0"):
		var enemy = Enemy0.instance()
		add_child(enemy)
		enemy.position = pos
	elif (enemy_type=="Enemy1"):
		var enemy = Enemy1.instance()
		add_child(enemy)
		enemy.position = pos
	pass