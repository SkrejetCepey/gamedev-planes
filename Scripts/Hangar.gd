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
var Air 
var flag = true
var i = 0
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
	#Air_Hangar
	Air_Hangar = $MarginContainer/VBoxContainer/MarginContainer2/MarginContainer/VBoxContainer/MarginContainer/Button_Air/TextureRect_Air
	
	
	#
	new_style = StyleBoxFlat.new()
	#Загрузка из json
	Hangar_data = SaveLoad.data
	#Присваивание переменных
	Dollar = Hangar_data["Dollar"]
	SelectedAir = Hangar_data["SelectedAir"]
	print(SelectedAir)
	#Выставляем данные в Ангар
	#for counter in Hangar_data:
		#print(counter)
	#Условия
	Air = Hangar_data["Air"]
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
				print(Air[i].air_img)
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
			#Если будет отсуствовать object button
		#с json на label
			#Цена истерибетелей
			obj_price_node.text = str(Air[i].price)
			#Броня
			if(Air[i].guard):
				pass
				#print(Air[i].guard)
			#Оружие
			if(Air[i].weapon):
				pass
				#print(Air[i].weapon)
			#Второе оружие
			if(Air[i].weapon_two):
				pass
	#Ограничитель счётчика
	for i in 7:
			#Label_Armor_Counter = i
			#Label_Armor.text[0] = str(i)
			pass
	pass 
	
#Главная кнопка
func _on_Button_StartGame_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/StartGame.tscn")
	pass 

func modifications(extra_arg_0):
	for i in Air:
		#print(i)
		if(i == str(SelectedAir)):
			#Броня
				if(extra_arg_0 == "1"):

					Label_Armor_Counter += 1 #Счетчик
					if(Label_Armor_Counter <= 6): #Ограничение до 6
						#Уровень брони
						Label_Armor.text[0] = str(Label_Armor_Counter) 
						Air[i].guard.level = Label_Armor_Counter
						#Цена брони
						SaveLoad.data.Dollar = SaveLoad.data.Dollar - (Air[i].guard.price * Label_Armor_Counter*7)
						Label_Armor_Counter += 1
						Label_Armor_price.text = str(Air[i].guard.price * Label_Armor_Counter*7)
						Label_Armor_Counter -= 1
						$HUD_elem.updateHud()
						SaveLoad.save_data(null,null)
			#Оружие
				elif(extra_arg_0 == "2"):
					Label_Weapon_Counter += 1 
					if(Label_Weapon_Counter <= 6):
						#Уровень оружия
						Label_Weapon.text[0] = str(Label_Weapon_Counter) 
						Air[i].weapon.level = Label_Weapon_Counter
						#Цена оружия
						SaveLoad.data.Dollar = SaveLoad.data.Dollar - (Air[i].weapon.price * Label_Weapon_Counter*7)
						Label_Weapon_Counter += 1
						Label_Weapon_price.text = str(Air[i].weapon.price * Label_Weapon_Counter*7)
						Label_Weapon_Counter -= 1
						$HUD_elem.updateHud()
						SaveLoad.save_data(null,null)
			#Второе оружие
				elif(extra_arg_0 == "3"):
					Label_Two_Weapon_Counter += 1
					if(Label_Two_Weapon_Counter <= 6):
						#Уровень 2-го оружия
						Label_Two_Weapon.text[0] = str(Label_Two_Weapon_Counter) 
						#Air[i].weapon_two.level = Label_Two_Weapon_Counter
						SaveLoad.data.Air[i].weapon_two.level = Label_Two_Weapon_Counter
						#Цена 2-го оружия
						SaveLoad.data.Dollar = SaveLoad.data.Dollar - (Air[i].weapon_two.price * Label_Two_Weapon_Counter*7)
						Label_Two_Weapon_Counter += 1
						Label_Two_Weapon_price.text = str(Air[i].weapon_two.price * Label_Two_Weapon_Counter*7)
						Label_Two_Weapon_Counter -= 1
						$HUD_elem.updateHud()
						SaveLoad.save_data(null,null)

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
	#bue = button + "1" 
	#Выбираем lock - является (куплен (false) / не куплен (true))
	if(Air[extra_arg_0].lock == false):
		#print(Air[extra_arg_0]
		SelectedAir = extra_arg_0
		update_data_their(extra_arg_0)
		
		SaveLoad.save_data(null,null)
		#Присваивание счетчика
		#print(SelectedAir)
	else:

		Hangar_data["Dollar"] = Dollar - Air[extra_arg_0].price
		$HUD_elem.updateHud()
		#Присваивание значений
		SelectedAir = extra_arg_0
		Air[extra_arg_0].lock = false
		update_data_their(extra_arg_0)
		SaveLoad.save_data(null,null)

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
	
	print(Air[extra_arg_0].air_img)
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


