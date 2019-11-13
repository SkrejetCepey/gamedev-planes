extends Node2D

export (PackedScene) var Mob
export (PackedScene) var Mob1

var EnemySpawner0 = Position2D.new()
var EnemySpawner1 = Position2D.new()
var EnemySpawner2 = Position2D.new()
var EnemySpawner3 = Position2D.new()

#const TestAbility = preload("res://Scenes/TestAbility.tscn")

func _ready():
	#randomize()
	add_child(EnemySpawner0)
	add_child(EnemySpawner1)
	add_child(EnemySpawner2)
	add_child(EnemySpawner3)
	EnemySpawner0.global_position = Vector2((get_viewport().get_visible_rect().size.x / 4)/2, 0)
	EnemySpawner1.global_position = Vector2((get_viewport().get_visible_rect().size.x / 2)*3/4, 0)
	EnemySpawner2.global_position = Vector2(3*(get_viewport().get_visible_rect().size.x / 4)*5/6, 0)
	EnemySpawner3.global_position = Vector2((get_viewport().get_visible_rect().size.x)*7/8, 0)
	
	#print(get_viewport().get_visible_rect().size.x / 4)
	$EnemySpawnTimer.start()
	pass 

func _on_EnemySpawnTimer_timeout():
	randomize()
	var situation = rand_range(0, 2)
	print (situation)
	if (situation<=1):
		spawnEnemy(EnemySpawner0, Mob)
		spawnEnemy(EnemySpawner1, Mob)
		spawnEnemy(EnemySpawner2, Mob)
		spawnEnemy(EnemySpawner3, Mob)
		#$EnemyPath/EnemySpawnLocation.set_offset(80)
		#var mob = Mob.instance()
		#if(EnemySpawner0.get_child_count()==0):
			#var mob = Mob.instance()
			#EnemySpawner0.add_child(mob)
			#mob.global_position = EnemySpawner0.global_position
			#mob.linear_velocity = Vector2(0,rand_range(mob.min_speed, mob.max_speed))
	elif (situation<=2):
		spawnEnemy(EnemySpawner0, Mob1)
		spawnEnemy(EnemySpawner1, Mob1)
		spawnEnemy(EnemySpawner2, Mob1)
		spawnEnemy(EnemySpawner3, Mob1)
		#$EnemyPath/EnemySpawnLocation.set_offset(80)
		#if(EnemySpawner0.get_child_count()==0):
			#var mob1 = Mob1.instance()
			#EnemySpawner0.add_child(mob1)
			#mob1.global_position = EnemySpawner0.global_position
			#mob1.linear_velocity = Vector2(0,rand_range(mob1.min_speed, mob1.max_speed))
	pass

func spawnEnemy(spawnPos, mob):
	if(spawnPos.get_child_count()==0):
			var enemy = mob.instance()
			spawnPos.add_child(enemy)
			enemy.global_position = spawnPos.global_position
			enemy.linear_velocity = Vector2(0,rand_range(enemy.min_speed, enemy.max_speed))
	pass