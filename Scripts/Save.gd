extends Node

const SAVE_PATH = "res://Json/Save/SaveLoad_update.json"
var _setting = {}
var save_dist = {"User": "Player", "money": 6}
var data = {}
func _ready():
	var data ={}
	
	print("\n") 
	#Пример просмотра json
	for node_path in data.keys():
			print(data[node_path])
	print("\n")
	
	pass 

func save_data(path,dictionary):
	#Принимаем значения
	#Создаем файл
	var save_file = File.new()
	save_file.open(path,File.WRITE)
	#Сохраняем значения в json
	save_file.store_line(to_json(dictionary))
	#Закрываем
	save_file.close()
	pass

func load_data(path):
	var load_file = File.new()
	load_file.open(path,File.READ)
	var text = load_file.get_as_text()
	data = parse_json(text) #теперь это словарь
	load_file.close()
	return data
	pass
