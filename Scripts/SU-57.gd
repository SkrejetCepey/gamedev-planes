extends Area2D

var straight = preload("res://Sprites/Player/Player.png")
var left = preload("res://Sprites/Player/Player_left.png")
var right = preload("res://Sprites/Player/Player_right.png")

var health = 150 
var hitTimer = 0

func _ready():
	add_to_group("player")
	pass 

func set_sprite(index):
	if index == 0:
		get_node("Sprite").set_texture(straight)
	elif index == 1:
		get_node("Sprite").set_texture(left)
	elif index == 2:
		get_node("Sprite").set_texture(right)
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