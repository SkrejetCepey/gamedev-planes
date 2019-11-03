extends Node2D

export (PackedScene) var Mob

func _ready():
	randomize()
	$EnemySpawnTimer.start()
	pass 

func _on_EnemySpawnTimer_timeout():
	$EnemyPath/EnemySpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	mob.position = $EnemyPath/EnemySpawnLocation.position
	mob.linear_velocity = Vector2(0,rand_range(mob.min_speed, mob.max_speed))
	pass
