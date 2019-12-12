extends Control
#Имена объектов Label
var Label_Two_Weapon 
var Label_Weapon
var Label_Armor
#Вывод цены для пользователей
var Label_Two_Weapon_price
var Label_Weapon_price
var Label_Armor_price
#Счетчики
var Label_Armor_Counter = 1
var Label_Weapon_Counter = 1
var Label_Two_Weapon_Counter = 1
#Стоимиость истребителя
var Air_price = 0
#Стоимость услуг объектов
var Armor_price = 0
var Weapon_price = 0
var Two_Weapon_price = 0
#Деньги
var Dollar = 0
#Выбран какой истребитель
var SelectedAir = 1
#
var Air_Hangar
var Dron_1_Hangar
var Dron_2_Hangar
#
var button1
var button2
#
var Button2_price_air

var array_button_price = []
#Словарь для Ангара
var Hangar_data = {}
var temp_air = []
#Переменные для словаря
var Change_Air_ColorRect
var Change_Dron_ColorRect
var Air 
var Dron
var flag = true
var i = 0
#var f = 0
var new_style
func _ready():
	#Присваивания node
	Label_Armor = $MarginContainer/VBoxContainer/MarginContainer/MarginContainer/HBoxContainer2/Button_Armor/Label_Armor
	Label_Weapon = $MarginContainer/VBoxContainer/MarginContainer/MarginContainer/HBoxContainer2/Button_Weapon/Label_Weapon
	Label_Two_Weapon = $MarginContainer/VBoxContainer/MarginContainer/MarginContainer/HBoxContainer2/Button_Two_Weapon/Label_Two_Weapon
	#Присваивания node price
	Label_Armor_price = $MarginContainer/VBoxContainer/MarginContainer/MarginContainer/HBoxContainer2/Button_Armor/Label_Armor_price
	Label_Two_Weapon_price = $MarginContainer/VBoxContainer/MarginContainer/MarginContainer/HBoxContainer2/Button_Two_Weapon/Label_Two_Weapon_price
	Label_Weapon_price = $MarginContainer/VBoxContainer/MarginContainer/MarginContainer/HBoxContainer2/Button_Weapon/Label_Weapon_price
	#
	button1 = $Change_Air_ColorRect/MarginContainer/VBoxContainer/ScrollContainer/GridContainer/Button1
	button2 = $Change_Air_ColorRect/MarginContainer/VBoxContainer/ScrollContainer/GridContainer/Button2
	#
	Button2_price_air = $Change_Air_ColorRect/MarginContainer/VBoxContainer/ScrollContainer/GridContainer/Button2/Button2_price_air
	Change_Air_ColorRect = $Change_Air_ColorRect
	Change_Dron_ColorRect = $Change_Dron_ColorRect
	#Главная кнопка Air
	Air_Hangar = $MarginContainer/VBoxContainer/MarginContainer2/MarginContainer/VBoxContainer/MarginContainer/Button_Air/TextureRect_Air
	#Главная кнопка Дрон 1
	Dron_1_Hangar = $MarginContainer/VBoxContainer/MarginContainer2/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/Button_Dron_1/TextureRect_Dron_one
	#Главная кнопка Дрон 2
	Dron_2_Hangar = $MarginContainer/VBoxContainer/MarginContainer2/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer2/Button_Dron_2/TextureRect_Dron_two
	
	
	#
	new_style = StyleBoxFlat.new()
	#Загрузка из json
	Hangar_data = SaveLoad.data
	#Присваивание переменных
	Dollar = Hangar_data["Dollar"]
	SelectedAir = Hangar_data["SelectedAir"]
	#print(SelectedAir)
	#Выставляем данные в Ангар
	#for counter in Hangar_data:
		#print(counter)

	#выбранный Дрон
	Dron = Hangar_data["Dron"]
	#print(Dron["2"])
	#######################Дроны############################################
	for f in Dron:
		#print(f)
		# Присваиваиваем ко всем кнопкам price
		var obj_price_dron = "Change_Dron_ColorRect/MarginContainer2/VBoxContainer/ScrollContainer/GridContainer/Button" + f + "/Button" + f + "_price_dron"
		# Присваиваиваем ко всем кнопкам name
		var obj_name_dron = "Change_Dron_ColorRect/MarginContainer2/VBoxContainer/ScrollContainer/GridContainer/Button" + f + "/Button" + f + "_name"
		# присваиваем Ноды созданные динамически
		var obj_price_dron_node = get_node(obj_price_dron)
		var obj_name_dron_node = get_node(obj_name_dron)
		#Если объектов в json не соотвествует кнопок в Godot, то просто пропускаем
		if(obj_price_dron_node == null || obj_name_dron == null):
			break
		#Присваивание объектов в не зависимости если купили объект
		obj_name_dron_node.text = str(Dron[f].name)
		#Если куплен дрон
		if(Dron[f].lock == false):
			#Если выбранна 1 кнопка
			if(Hangar_data["SelectedDron1"]):
				#print(str(Dron[str(Hangar_data["SelectedDron1"])].dron_img))
				Dron_1_Hangar.texture = load(str(Dron[str(Hangar_data["SelectedDron1"])].dron_img))
				pass
			if(Hangar_data["SelectedDron2"]):
				#print(str(Dron[str(Hangar_data["SelectedDron2"])].dron_img))
				Dron_2_Hangar.texture = load(str(Dron[str(Hangar_data["SelectedDron2"])].dron_img))
				pass
			pass
			#Если выбранна 2 кнопка
			
		else:
			#Присваивание параметров в Label
			obj_price_dron_node.text = str(Dron[f].price)
			pass
		
	#выбранный самолет
	Air = Hangar_data["Air"]
	##################################Истребители########################
	for i in Air:
		#Присваиваем значения Label
		var obj_price = "Change_Air_ColorRect/MarginContainer/VBoxContainer/ScrollContainer/GridContainer/Button" + i + "/Button" + i + "_price_air"
		var obj_name = "Change_Air_ColorRect/MarginContainer/VBoxContainer/ScrollContainer/GridContainer/Button" + i + "/Button" + i + "_name"
		var obj_price_node = get_node(obj_price)
		var obj_name_node = get_node(obj_name)
		if(obj_price_node == null || obj_name == null):
			break
	#Присваивание всех объектов
		#Имени истерибителя
		obj_name_node.text = str(Air[i].name)
		#Дамаг
		#Уровень здоровья	
		#Если куплен объект
		if(Air[i].lock == false):
			#Если выбран текущий объект
			if(i == str(SelectedAir)):
			#Модификаций
				var mod_weapon_two_level = Air[i].weapon_two.level
				var mod_weapon_level = Air[i].weapon.level
				var mod_guard_level = Air[i].guard.level
				#Присваивания уровня
				Label_Two_Weapon.text[0] = str(mod_weapon_two_level) # 2-го оружия
				Label_Weapon.text[0] = str(mod_weapon_level) #оружия
				Label_Armor.text[0] = str(mod_guard_level) #брони
				#Присваивание счетчика
				Label_Two_Weapon_Counter = mod_weapon_two_level
				Label_Weapon_Counter = mod_weapon_level
				Label_Armor_Counter = mod_guard_level
				#Присваивания цены
				Label_Two_Weapon_price.text = str(Air[i].weapon_two.price) #2-го оружия
				Label_Weapon_price.text = str(Air[i].weapon.price ) #оружия
				Label_Armor_price.text = str(Air[i].guard.price) #брони
				#При загрузки подгрузится выбранная картинка для самолета
				Air_Hangar.texture = load(str(Air[i].air_img))
				#print(Air[i].air_img)
				#Air_Hangar.texture = load("res://Interface/Hangar/Air/Air_" + str(SelectedAir) +".png")
				#Если в модификациях = 6, то обнуляем price 
				if(mod_weapon_two_level == 6):
					Label_Two_Weapon_price.text = " "
				if(mod_weapon_level == 6):
					Label_Weapon_price.text = " "
				if(mod_guard_level == 6):
					Label_Armor_price.text = " "
					
			pass
		#Или нет
		else:
			#Цена истерибетелей
			obj_price_node.text = str(Air[i].price)
		##################################Конец Истребители########################
	pass 
	
#Главная кнопка
func _on_Button_StartGame_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/StartGame.tscn")
	pass 
##############Модификации оружии####################################################
func modifications(extra_arg_0):
	for i in Air:
		#print(i)
		if(i == str(SelectedAir)):
			#Броня
				if(extra_arg_0 == "1"):
					if(Label_Armor_Counter <= 5): #Ограничение до 6
						if(Dollar >= int(Label_Armor_price.text)):
							#Цена брони
							SaveLoad.data.Dollar = Dollar - int(Label_Armor_price.text)
							#приравняли локальный доллар
							Dollar = SaveLoad.data.Dollar
							#Прибавляем +1
							Label_Armor_Counter += 1
							#Уровень брони
							Label_Armor.text[0] = str(Label_Armor_Counter) 
							Air[i].guard.level = Label_Armor_Counter
							#Прибавляем +1 к счетчику чтобы узнать следующию цену брони и вписать в labelprice
							Label_Armor_Counter += 1
							Label_Armor_price.text = str(Label_Armor_Counter*int(Label_Armor_price.text))
							#добавляем следующию цену в Armor price
							Air[i].guard.price = int(Label_Armor_price.text)
							Label_Armor_Counter -= 1
							#
							if(Label_Armor_Counter == 6):
								Label_Armor_price.text = " "

							$HUD_elem.updateHud()
							SaveLoad.save_data(null,null)
						else:
							print("Денег нет")

						
			#Оружие
				elif(extra_arg_0 == "2"):
					if(Label_Weapon_Counter <= 5):
						if(Dollar >= int(Label_Weapon_price.text)):
							#Цена оружия
							SaveLoad.data.Dollar = Dollar -  int(Label_Weapon_price.text)
							#приравняли локальный доллар
							Dollar = SaveLoad.data.Dollar
							#Прибавляем +1
							Label_Weapon_Counter += 1 
							#Уровень оружия
							Label_Weapon.text[0] = str(Label_Weapon_Counter) 
							Air[i].weapon.level = Label_Weapon_Counter
							#Прибавляем +1 к счетчику чтобы узнать следующию цену брони и вписать в labelprice
							Label_Weapon_Counter += 1
							Label_Weapon_price.text = str(Label_Weapon_Counter * int(Label_Weapon_price.text))
							Label_Weapon_Counter -= 1
							#
							if(Label_Weapon_Counter == 6):
								Label_Weapon_price.text = " "
							
							$HUD_elem.updateHud()
							SaveLoad.save_data(null,null)
						else: 
							print("Денег нет")
			#Второе оружие
				elif(extra_arg_0 == "3"):
					if(Label_Two_Weapon_Counter <= 5):
						if(Dollar >= int(Label_Two_Weapon_price.text)):
							#Цена оружия
							SaveLoad.data.Dollar = Dollar - int(Label_Two_Weapon_price.text)
							#приравняли локальный доллар
							Dollar = SaveLoad.data.Dollar
							#
							Label_Two_Weapon_Counter += 1
							#Уровень 2-го оружия
							Label_Two_Weapon.text[0] = str(Label_Two_Weapon_Counter) 
							Air[i].weapon_two.level = Label_Two_Weapon_Counter
							#
							Label_Two_Weapon_Counter += 1
							Label_Two_Weapon_price.text = str(Label_Weapon_Counter * int(Label_Two_Weapon_price.text))
							Label_Two_Weapon_Counter -= 1
							#
							if(Label_Two_Weapon_Counter == 6):
								Label_Two_Weapon_price.text = " "
							#
							$HUD_elem.updateHud()
							SaveLoad.save_data(null,null)
						else:
							print("Денег нет")
	pass



#Переход на покупку истребителей
func _on_Button_Air_pressed():
	Change_Air_ColorRect.show()
	pass 


#Закрыть и подтвердить покупку самлета
func _on_ChangeAir_pressed():
	Change_Air_ColorRect.hide()
	pass 


#Покупка истребителей
func buyAir(extra_arg_0):
	#Выбираем lock - является (куплен (false) / не куплен (true))
	if(Air[extra_arg_0].lock == false):
		SelectedAir = extra_arg_0
		update_data_their(extra_arg_0)
		
		SaveLoad.save_data(null,null)
		#Присваивание счетчика
	else:
		if(Dollar <= Air[extra_arg_0].price):
			print("Денег нет")
		else:
			Hangar_data["Dollar"] = Dollar - Air[extra_arg_0].price
			$HUD_elem.updateHud()
			Dollar = Hangar_data["Dollar"]
			#Присваивание значений
			SelectedAir = extra_arg_0
			Air[extra_arg_0].lock = false
			update_data_their(extra_arg_0)
			SaveLoad.save_data(null,null)
	pass

func update_data_their(extra_arg_0):
	Hangar_data["SelectedAir"] = SelectedAir
	#Присваивания уровня	
	Label_Armor_Counter = Air[extra_arg_0].guard.level
	Label_Weapon_Counter = Air[extra_arg_0].weapon.level
	Label_Two_Weapon_Counter = Air[extra_arg_0].weapon_two.level
	#Присваивания цены
	Label_Two_Weapon_price.text = str(Air[extra_arg_0].weapon_two.price) #цена 2-го оружия
	Label_Weapon_price.text = str(Air[extra_arg_0].weapon.price) #цена оружия
	Label_Armor_price.text = str(Air[extra_arg_0].guard.price) #цена брони	
	#
	Label_Armor.text[0] = str(Air[extra_arg_0].guard.level)
	Label_Weapon.text[0] = str(Air[extra_arg_0].weapon.level) 
	Label_Two_Weapon.text[0] = str(Air[extra_arg_0].weapon_two.level) 
	#При выборе подгрузится выбранная картинка для самолета
	#Air[extra_arg_0].air_img
	Air_Hangar.texture = load(Air[extra_arg_0].air_img)
	#Air_Hangar.texture = load("res://Interface/Hangar/Air/Air_" + str(extra_arg_0) +".png")
	pass


#BorderColor("#009688")
#button1.set('custom_styles/normal',new_style)
func BorderColor(text):
	new_style.border_width_bottom = 5
	new_style.border_width_top = 5
	new_style.border_width_left = 5
	new_style.border_width_right = 5
	new_style.border_color = Color(text)
	pass

########################DRON###################################################
func _on_ChangeDron_pressed():
	Change_Dron_ColorRect.hide()
	pass 

#####Ловим события какая кнопка Dron была вызвана###################
#Выбранная кнопка SelectedDron
var SelectedDron = 1
func Change_dron(extra_arg_0):
	if("SelectedDron" + str(extra_arg_0)):
		#### Присвоим
		#Hangar_data["SelectedDron" + str(extra_arg_0)]
		SelectedDron = extra_arg_0
		pass
	Change_Dron_ColorRect.show()
	#print(extra_arg_0)
	pass 
######Покупка Дрона#####################################################
func buyDron(extra_arg_0):
		#Если объект куплен, то выбераем
		if(Dron[extra_arg_0].lock == false):
			#Если нажата левая кнопка дрона
			if(SelectedDron == 1):
				SaveLoad.data["SelectedDron1"] = extra_arg_0
				Dron_1_Hangar.texture = load(str(Dron[extra_arg_0].dron_img))
				pass
			#Если нажата правая кнопка дрона
			if(SelectedDron == 2):
				SaveLoad.data["SelectedDron2"] = extra_arg_0
				Dron_2_Hangar.texture = load(str(Dron[extra_arg_0].dron_img))
				pass
			SaveLoad.save_data(null,null)
			print(extra_arg_0)
		#Если объект не куплен, то выбераем
		else: 
			print(Dron[extra_arg_0].lock)
			if(Dollar <= Dron[extra_arg_0].price):
				print("Денег нет")
			else:
				#Если выбрана левая кнопка дрона
				if(SelectedDron == 1):
					Hangar_data["Dollar"] = Dollar - Dron[extra_arg_0].price
					$HUD_elem.updateHud()
					Dollar = Hangar_data["Dollar"]
					SaveLoad.data["SelectedDron1"] = extra_arg_0
					Dron_1_Hangar.texture = load(str(Dron[extra_arg_0].dron_img))
					Dron[extra_arg_0].lock = false
					SaveLoad.save_data(null,null)
					pass
				#Если нажата правая кнопка дрона
				if(SelectedDron == 2):
					Hangar_data["Dollar"] = Dollar - Dron[extra_arg_0].price
					$HUD_elem.updateHud()
					Dollar = Hangar_data["Dollar"]
					SaveLoad.data["SelectedDron2"] = extra_arg_0
					Dron_2_Hangar.texture = load(str(Dron[extra_arg_0].dron_img))
					Dron[extra_arg_0].lock = false
					SaveLoad.save_data(null,null)
					pass
				pass
		pass
	



