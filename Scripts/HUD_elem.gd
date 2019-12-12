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
	#panel = get_node("Panel")
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



var reset_json = {"Air":{"1":{"air_img":"res://Interface/Hangar/Air/Air_1.png","guard":{"level":1,"price":500},"lock":false,"name":"Su-57","price":0,"weapon":{"level":1,"price":1500},"weapon_two":{"level":1,"price":1000}},"2":{"air_img":"res://Interface/Hangar/Air/Air_2.png","guard":{"level":1,"price":1000},"lock":true,"name":"Mig-57","price":10000,"weapon":{"level":1,"price":2000},"weapon_two":{"level":1,"price":1500}},"3":{"air_img":"res://Interface/Hangar/Air/Air_3.png","guard":{"level":1,"price":1500},"lock":true,"name":"oct-23","price":30000,"weapon":{"level":1,"price":2500},"weapon_two":{"level":1,"price":2000}},"4":{"air_img":"res://Interface/Hangar/Air/Air_4.png","guard":{"level":1,"price":2000},"lock":true,"name":"Bg-77","price":50000,"weapon":{"level":1,"price":3000},"weapon_two":{"level":1,"price":2500}},"5":{"air_img":"path","guard":{"level":1,"price":2500},"lock":true,"name":"Mig-57","price":80000,"weapon":{"level":1,"price":3500},"weapon_two":{"level":1,"price":3000}}},"Dollar":100000,"Dron":{"1":{"damage":100,"dron_img":"res://Interface/Hangar/Dron/dron_1.png","guard":100,"lock":false,"name":"ScanEagle","price":15000},"2":{"damage":1,"dron_img":"res://Interface/Hangar/Dron/dron_2.png","guard":100,"lock":false,"name":"RQShadow","price":25000},"3":{"damage":100,"dron_img":"res://Interface/Hangar/Dron/dron_3.png","guard":100,"lock":true,"name":"MQ1Predator","price":35000},"4":{"damage":100,"dron_img":"res://Interface/Hangar/Dron/dron_4.png","guard":100,"lock":true,"name":"RQ4GlobalHawk","price":40000}},"Emerald":0,"Person_img":"path","Points":1,"SelectedAir":1,"SelectedDron1":1,"SelectedDron2":"2","Setting":{"OnSoundGame":true,"OnSoundMain":true,"SoundGame":0,"SoundMain":0,"lang":"ru"},"TotalDistance":102,"User":"Player"}

func _on_Button_pressed():
	var dir = Directory.new()
	dir.remove("user://SaveLoad_update.json")
	SaveLoad.save_data("user://SaveLoad_update.json",reset_json)
	SaveLoad.load_data("user://SaveLoad_update.json")
	pass # Replace with function body.
