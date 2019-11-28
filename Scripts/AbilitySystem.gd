extends Node2D

const Ability = preload("res://Scenes/Abilities/TestAbility.tscn")

var ability_type
var drop_chance = 0
var ability_group

var chance = [null,null,null]

func _ready():
	randomize()
	add_to_group("ability")
	if (drop_chance >= rand_range(0, 1)):
		var temp = rand_range(0, drop_chance)
		var summ = 0
		for i in range(chance.size()):
			if(chance[i]+summ>=temp):
				var ability = Ability.instance()
				ability.initialize(ability_type[i], ability_group)
				add_child(ability)
				return
			summ += chance[i]
	pass

func initialize(_ability_type, _drop_chance, _ability_group):
	ability_type=_ability_type
	ability_group=_ability_group
	for i in range(_drop_chance.size()):
		drop_chance = drop_chance + _drop_chance[i]
		chance[i]=_drop_chance[i]
	if (drop_chance>1):
		drop_chance=0
	pass

func destroy():
	queue_free()
	pass