extends Node2D

const Hive = preload("res://Scenes/Hive.tscn")
const Event = preload("res://Scenes/BossEvent.tscn")

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
	if (enemy_type=="Hive"):
		var event = Event.instance()
		add_child(event)
		yield(get_tree().create_timer(3), "timeout")
		var enemy = Hive.instance()
		add_child(enemy)
		enemy.position = pos
	pass