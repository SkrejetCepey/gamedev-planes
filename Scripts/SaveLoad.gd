extends Node

#var SAVE_PATH = "res://Json/Save/SaveLoad_update.json"
var mobile_path = "user://SaveLoad_update.json"

var data = { "User":"Player", "Dollar":0, "Emerald":0, "SelectedAir": 1, "TotalDistance": 102, "Person_img": "path", "Air": { "1": { "lock" : false, "price" : 0, "name": "Su-57", "air_img": "path", "weapon": { "level":1, "price": 3333 }, "weapon_two": { "level":1, "price": 2 }, "guard": { "level":1, "price": 3 } }, "2": { "lock" : true, "price" : 10000, "name": "Mig-57", "air_img": "path", "weapon": { "level":1, "price": 11 }, "weapon_two": { "level":1, "price": 22 }, "guard": { "level":1, "price": 33 } }, "3": { "lock" : true, "price" : 30000, "name": "oct-23", "air_img": "path", "weapon": { "level":1, "price": 111 }, "weapon_two": { "level":1, "price": 222 }, "guard": { "level":1, "price": 333 } }, "4": { "lock" : true, "price" : 50000, "name": "Bg-77", "air_img": "path", "weapon": { "level":1, "price": 1111 }, "weapon_two": { "level":1, "price": 2222 }, "guard": { "level":1, "price": 3333 } }, "5": { "lock" : true, "price" : 80000, "name": "Mig-57", "air_img": "path", "weapon": { "level":1, "price": 3000 }, "weapon_two": { "level":1, "price": 2000 }, "guard": { "level":1, "price": 1600 } } }, "Dron": { "dron_img": "path", "type": 0 }, "Dron_two": { "dron_two_img": "path", "type": 0 }, "Setting": { "OnSoundMain": true, "OnSoundGame": true, "SoundMain": 0, "SoundGame": 0, "lang": "ru" } }

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