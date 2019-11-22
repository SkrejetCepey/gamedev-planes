extends Node2D

const Ability = preload("res://Scenes/Abilities/TestAbility.tscn")

var ability_type

func _ready():
	randomize()
	add_to_group("ability")
	var temp = rand_range(0, 3)
	if (temp <= 2):
		var ability = Ability.instance()
		ability.initialize(ability_type[temp])
		add_child(ability)
	pass

func initialize(_ability_type):
	ability_type=_ability_type
	pass
	
func destroy():
	queue_free()
	pass