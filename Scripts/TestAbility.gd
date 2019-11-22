extends RigidBody2D

export var speed = 100
var velocity = Vector2()
var ability_type

func _physics_process(delta):
	if(position.y > get_viewport().get_visible_rect().size.y + 10):
		get_parent().destroy()
	pass
	
func _ready():
	add_to_group("ability")
	print(rand_range(0, 2))
	if(rand_range(0, 2) < 1):
		linear_velocity.x = 100
	else:
		linear_velocity.x= -100
	pass

func initialize(_ability_type):
	ability_type = _ability_type
	if(ability_type=="repairkit"):
		$Sprite.texture = load("res://Sprites/Repairkit.png")
	elif(ability_type=="speedboost"):
		$Sprite.texture = load("res://Sprites/Speed.png")
	elif(ability_type=="shield"):
		$Sprite.texture = load("res://Sprites/Shield.png")
	pass

func _on_Trigger_area_entered(someone):
	if (someone.is_in_group("player")==true):
		if (ability_type=="repairkit"):
			someone.health+=50
		get_parent().destroy()
	pass
