extends VBoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var PopupPanell
# Called when the node enters the scene tree for the first time.
func _ready():

	PopupPanell = get_node("HBoxContainer2")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_Setting_pressed():

	PopupPanell.show()
	pass # Replace with function body.
