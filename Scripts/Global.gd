extends Control

func _ready():
	var audio_file = "res://Music/Other/MainMenuTheme.wav"
	
	if File.new().file_exists(audio_file) and get_node("/root/SoundHandler").get_child(0).playing==false:
		var sfx = load(audio_file)
		get_node("/root/SoundHandler").get_child(0).stream = sfx
	
	if(get_node("/root/SoundHandler").get_child(0).playing==false):
		get_node("/root/SoundHandler").get_child(0).play()
	pass

func _on_Button_PLAY_pressed():
	get_tree().change_scene("res://Scenes/ArcadeScene.tscn")
	pass 

func _on_Button_Hangar_pressed():
	get_tree().change_scene("res://Scenes/Hangar.tscn")
	pass