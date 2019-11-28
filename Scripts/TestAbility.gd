extends RigidBody2D

const Ability = preload("res://Sprites/Materials/Abilities.tres")

export var speed = 100
var velocity = Vector2()
var ability_type
var ability_group

func _physics_process(delta):
	if(position.y > get_viewport().get_visible_rect().size.y + 10): get_parent().destroy()
	pass
	
func _ready():
	add_to_group("ability")
	if (ability_group=="cash"):
		mass=10
		gravity_scale=1
		collision_layer=8
		collision_mask=8
	elif (ability_group=="ability"):
		mass=5.1
		gravity_scale=0.5
		collision_layer=4
		collision_mask=4
	if(rand_range(0, 2) < 1): linear_velocity.x = 100
	else: linear_velocity.x= -100
	$AnimationPlayer.play("AnimationSprite")
	pass

func initialize(_ability_type, _ability_group):
	ability_type = _ability_type
	ability_group = _ability_group
	if (ability_type!=null): $Sprite.texture = load("res://Sprites/"+ability_type+".png")
		#if(ability_type=="Repairkit"):
		#	Ability.color = Color.green
		#elif(ability_type=="Speedboost"):
		#	Ability.color = Color.orange
		#elif(ability_type=="Shield"):
		#	Ability.color = Color.blue
		#$Whoo.process_material = Ability

func _on_Trigger_area_entered(someone):
	if (someone.is_in_group("player")==true):
		if (ability_type=="repairkit"): someone.health+=50
		get_parent().destroy()
	pass
