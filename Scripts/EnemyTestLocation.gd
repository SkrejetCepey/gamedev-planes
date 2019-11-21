extends Node2D

export (PackedScene) var Mob
export (PackedScene) var Mob1

const Bullet = preload("res://Scenes/Bullet.tscn")

var PlayerTest = Area2D.new()
var PhysicsPlayer = CollisionShape2D.new()
var SpritePlayer = Sprite.new()

var EnemySpawner0 = Position2D.new()
var EnemySpawner1 = Position2D.new()
var EnemySpawner2 = Position2D.new()
var EnemySpawner3 = Position2D.new()

func _ready():
	EnemySpawner0.name = "EnemySpawner0"
	EnemySpawner1.name = "EnemySpawner1"
	EnemySpawner2.name = "EnemySpawner2"
	EnemySpawner3.name = "EnemySpawner3"
	
	var bullet = Bullet.instance()
	bullet.initialize(Vector2(100,100),Vector2(0,1),180,800,50,"enemy")
	add_child(bullet)
	
	#add_child(PlayerTest)
	#PhysicsPlayer.shape = Shape2D()
	#PlayerTest.add_child(PhysicsPlayer)
	
	
	add_child(EnemySpawner0)
	add_child(EnemySpawner1)
	add_child(EnemySpawner2)
	add_child(EnemySpawner3)
	
	EnemySpawner0.global_position = Vector2((get_viewport().get_visible_rect().size.x / 4)/2, 0)
	EnemySpawner1.global_position = Vector2((get_viewport().get_visible_rect().size.x / 2)*3/4, 0)
	EnemySpawner2.global_position = Vector2(3*(get_viewport().get_visible_rect().size.x / 4)*5/6, 0)
	EnemySpawner3.global_position = Vector2((get_viewport().get_visible_rect().size.x)*7/8, 0)
	
	
	
	$EnemySpawnTimer.start()
	pass 

func _on_EnemySpawnTimer_timeout():
	randomize()
	
	var poop = null
	
	for i in range(0, 4):
		randomize()
		var situation = rand_range(0, 2)
		if (situation<=1):
			poop = Mob1
		elif (situation<=2):
			poop = Mob
		spawnEnemy(get_node("EnemySpawner"+str(i)), poop)
	pass

func spawnEnemy(spawnPos, mob):
	if(spawnPos.get_child_count()==0):
			var enemy = mob.instance()
			spawnPos.add_child(enemy)
			enemy.global_position = spawnPos.global_position
	pass
