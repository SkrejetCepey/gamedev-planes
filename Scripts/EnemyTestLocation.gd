extends Node2D

export (PackedScene) var Mob
export (PackedScene) var Mob1

const TestAbility = preload("res://Scenes/TestAbility.tscn")

func _ready():
	randomize()
	$EnemySpawnTimer.start()
	pass 

func _on_EnemySpawnTimer_timeout():
	randomize()
	var situation = rand_range(0, 2)
	print (situation)
	if (situation<=1):
		$EnemyPath/EnemySpawnLocation.set_offset(randi())
		var mob1 = Mob1.instance()
		add_child(mob1)
		mob1.position = $EnemyPath/EnemySpawnLocation.position
		mob1.linear_velocity = Vector2(0,rand_range(mob1.min_speed, mob1.max_speed))
	elif (situation<=2):
		$EnemyPath/EnemySpawnLocation.set_offset(randi())
		var mob = Mob.instance()
		add_child(mob)
		mob.position = $EnemyPath/EnemySpawnLocation.position
		mob.linear_velocity = Vector2(0,rand_range(mob.min_speed, mob.max_speed))
	pass
