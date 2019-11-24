extends Node2D

export (PackedScene) var Mob
export (PackedScene) var Mob1

var EnemyPath = Path2D.new()
var EnemySpawnLocation = PathFollow2D.new()

const Player = preload("res://Scenes/Player.tscn")

func _ready():
	randomize()
	var player = Player.instance()
	add_child(player)
	
	add_child(EnemyPath)
	EnemyPath.add_child(EnemySpawnLocation)
	EnemyPath.curve.add_point(Vector2(50,-10))
	EnemyPath.curve.add_point(Vector2(get_viewport().get_visible_rect().size.x - 50,-10))
	$StaticBody2D/Wall_left.global_position = Vector2(-5, $StaticBody2D/Wall_left.global_position.y)
	$StaticBody2D/Wall_right.global_position = Vector2(get_viewport().get_visible_rect().size.x + 5, $StaticBody2D/Wall_left.global_position.y)
	$EnemySpawnTimer.start()
	pass 

func _on_EnemySpawnTimer_timeout():
	randomize()
	var situation = rand_range(0, 2)
	print (situation)
	if (situation<=1):
		EnemySpawnLocation.set_offset(randi())
		var mob1 = Mob1.instance()
		get_node("EnemySpawner").add_child(mob1)
		mob1.position = EnemySpawnLocation.position
	elif (situation<=2):
		EnemySpawnLocation.set_offset(randi())
		var mob = Mob.instance()
		get_node("EnemySpawner").add_child(mob)
		mob.position = EnemySpawnLocation.position
	pass
