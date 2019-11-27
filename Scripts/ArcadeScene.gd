extends Node2D

const EnemyInitializer = preload("res://Scenes/EnemyInitializer.tscn")

var EnemyPath = Path2D.new()
var EnemySpawnLocation = PathFollow2D.new()

const Player = preload("res://Scenes/Player.tscn")

var enemy = EnemyInitializer.instance()

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
	
	add_child(enemy)
	pass 

func _on_EnemySpawnTimer_timeout():
	randomize()
	var situation = rand_range(0, 3)
	if (situation<=1):
		EnemySpawnLocation.set_offset(randi())
		enemy.initialize("Enemy0", EnemySpawnLocation.position)
	elif (situation<=2):
		EnemySpawnLocation.set_offset(randi())
		enemy.initialize("Enemy1", EnemySpawnLocation.position)
	elif (situation<=3):
		EnemySpawnLocation.set_offset(randi())
		enemy.initialize("Enemy2", EnemySpawnLocation.position)
	pass
