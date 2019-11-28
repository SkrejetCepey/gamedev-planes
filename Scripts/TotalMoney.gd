extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Dollar = 1
var Emerald = 0

var load_hud = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	#load_hud = Save.load_data("res://Json/Save/save.json")
	#Dollar = load_hud["money"]
	pass # Replace with function body.

func update_dollar(text):
	load_hud["money"] = text
	Dollar = text
	#print(load_hud["money"])
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
