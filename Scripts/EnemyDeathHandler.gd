extends Node2D

const Ability = preload("res://Scenes/AbilitySystem.tscn")

var dic_boosts
var dic_chance
var pos

func _ready():
	
	pass
	
func ability_initialize(_dic_boosts, _dic_chance, _pos):
	dic_boosts = _dic_boosts
	dic_chance = _dic_chance
	pos = _pos
	#self.position = pos
	var ability = Ability.instance()
	ability.initialize(dic_boosts, dic_chance, "ability")
	ability.global_position = pos
	add_child(ability)
	pass 