extends CanvasLayer
signal ArcadeScene
var panel

#node Label
var Label_Dollar
var Label_Emerald


func _ready():
	Label_Dollar = $MarginContainer/HBoxContainer/Panel_Dollar/MarginContainer/HBoxContainer/Label_Dollar
	Label_Emerald = $MarginContainer/HBoxContainer/Panel_Emerald/MarginContainer/HBoxContainer/Label_Emerald
	Label_Dollar.text = str(SaveLoad.data.Dollar)
	Label_Emerald.text = str(SaveLoad.data.Emerald)
	panel = get_node("Panel")
	pass 

func updateHud():
		Label_Dollar.text = str(SaveLoad.data.Dollar)
		Label_Emerald.text = str(SaveLoad.data.Emerald)

func _on_Button_Setting_pressed():
	panel.show()
	pass # Replace with function body.


func _on_Button_accept_pressed():
	panel.hide()
	pass # Replace with function body.


