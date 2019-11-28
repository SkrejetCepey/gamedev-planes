extends Node

const SAVE_PATH = "res://Json/Save/SaveLoad_update.json"
var data = {}

func _ready():
	load_data(SAVE_PATH)
	pass # Replace with function body.

func save_data_null():
	var save_file = File.new()
	save_file.open(SAVE_PATH,File.WRITE)
	#Сохраняем значения в json
	save_file.store_line(to_json(data))
	#Закрываем
	save_file.close()
	pass

func save_data(path,dictionary):
	var save_file = File.new()
	if(path == null || path == ""):
		save_file.open(SAVE_PATH,File.WRITE)
	elif(dictionary == null || dictionary == ""):
		save_file.store_line(to_json(data))
	#Принимаем значения
	#Создаем файл
	else:
		save_file.open(path,File.WRITE)
	#Сохраняем значения в json
		save_file.store_line(to_json(dictionary))
	#Закрываем
	save_file.close()
	pass

func load_data(path):
	var load_file = File.new()
	if(path == null || path == ""):
		load_file.open(SAVE_PATH,File.WRITE)
	else: 
		load_file.open(path,File.READ)
	var text = load_file.get_as_text()
	data = parse_json(text) #теперь это словарь
	load_file.close()
	return data
	pass