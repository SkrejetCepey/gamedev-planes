extends Node

#var SAVE_PATH = "res://Json/Save/SaveLoad_update.json"
var mobile_path = "user://SaveLoad_update.json"

var data = {"Air":{"1":{"air_img":"res://Interface/Hangar/Air/Air_1.png","guard":{"level":2,"price":9},"lock":false,"name":"Su-57","price":0,"weapon":{"level":1,"price":3333},"weapon_two":{"level":1,"price":2}},"2":{"air_img":"res://Interface/Hangar/Air/Air_2.png","guard":{"level":1,"price":33},"lock":true,"name":"Mig-57","price":10000,"weapon":{"level":1,"price":11},"weapon_two":{"level":1,"price":22}},"3":{"air_img":"res://Interface/Hangar/Air/Air_3.png","guard":{"level":1,"price":333},"lock":true,"name":"oct-23","price":30000,"weapon":{"level":1,"price":111},"weapon_two":{"level":1,"price":222}},"4":{"air_img":"res://Interface/Hangar/Air/Air_4.png","guard":{"level":1,"price":3333},"lock":true,"name":"Bg-77","price":50000,"weapon":{"level":1,"price":1111},"weapon_two":{"level":1,"price":2222}},"5":{"air_img":"path","guard":{"level":1,"price":1600},"lock":true,"name":"Mig-57","price":80000,"weapon":{"level":1,"price":3000},"weapon_two":{"level":1,"price":2000}}},"Dollar":10997,"Dron":{"dron_img":"path","type":0},"Dron_two":{"dron_two_img":"path","type":0},"Emerald":0,"Person_img":"path","SelectedAir":1,"Setting":{"OnSoundGame":true,"OnSoundMain":true,"SoundGame":0,"SoundMain":0,"lang":"ru"},"TotalDistance":102,"User":"Player"}

func _ready():
	load_data(null)
	pass

func save_data(path,dictionary):
	var save_file = File.new()
	if(path == null && dictionary == null):
		if save_file.file_exists(mobile_path):
			save_file.open(mobile_path,File.WRITE)
			save_file.store_line(to_json(data))
	else:
		save_file.open(path,File.WRITE)
		save_file.store_line(to_json(dictionary))
	save_file.close()
	pass

func load_data(path):
	var load_file = File.new()
	if(path == null || path == ""):
		if (load_file.file_exists(mobile_path) == true):
			data = {}
			load_file.open(mobile_path,File.READ)
			var text = load_file.get_as_text()
			data = parse_json(text)
		else: 
			save_data(mobile_path,data)
	else:
		load_file.open(path,File.READ)
		var text = load_file.get_as_text()
		data = parse_json(text) #теперь это словарь
	load_file.close()
	return data
	pass