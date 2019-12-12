extends CanvasLayer

func _ready():
	pass 

func _on_Button_Ok_pressed():
	get_tree().change_scene("res://Scenes/StartGame.tscn")
	pass 

func _on_Button_continue_pressed():
	get_tree().change_scene("res://Scenes/ArcadeScene.tscn")
	pass 