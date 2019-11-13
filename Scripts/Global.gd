extends Control

var current_scene = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	pass

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

func _on_Button_PLAY_pressed():
	Global.goto_scene("res://Scenes/ArcadeScene.tscn")
	pass 


func _on_Button_Hangar_pressed():
	Global.goto_scene("res://Scenes/Hangar.tscn")
	pass # Replace with function body.

#Hangar.tscn
func _on_Button_StartGame_pressed():
	Global.goto_scene("res://Scenes/StartGame.tscn")
	pass # Replace with function body.
