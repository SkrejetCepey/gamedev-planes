extends Control

func _ready():
	pass

func _on_Button_PLAY_pressed():
	get_tree().change_scene("res://Scenes/ArcadeScene.tscn")
	pass 


func _on_Button_Hangar_pressed():
	get_tree().change_scene("res://Scenes/Hangar.tscn")
	pass