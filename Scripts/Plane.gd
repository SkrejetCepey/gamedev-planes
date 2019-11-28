extends Area2D

var health = 150 
var hitTimer = 0

func _ready():
	add_to_group("player")
	pass 

func get_damaged(dmg):
	if hitTimer <= 0:
		health -= dmg
		if health <= 0:
			get_parent().self_destruct()
		hitTimer = 60
	pass
	
func _physics_process(delta):
	hitTimer -= 1
	pass