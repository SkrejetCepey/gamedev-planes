extends CanvasLayer

signal ArcadeScene

var panel

var AudioStreamPlayer_slider_SoundMain
func _ready():
	panel = get_node("Panel")
	pass 



func _on_Button_Setting_pressed():
	panel.show()
	pass # Replace with function body.


func _on_Button_accept_pressed():
	panel.hide()
	pass # Replace with function body.


