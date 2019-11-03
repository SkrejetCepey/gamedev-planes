extends Node2D

const Player = preload("res://scenes/Player.tscn")

func _ready():
	var player = Player.instance()
	add_child(player)
