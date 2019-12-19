extends CanvasLayer

var current_hp
var max_hp

func _ready():
	pass

func health_damaged(damage):
	current_hp-=damage
	$VBoxContainer/HBoxContainer/MarginContainer2/HealthBar.value = int((float(current_hp)/max_hp)*100)
	
func health_setup(MaxHealth):
	$VBoxContainer/HBoxContainer/MarginContainer2/HealthBar.value = MaxHealth
	max_hp = MaxHealth
	current_hp = max_hp
	pass
	
func health_update(bonus_health):
	if (current_hp + bonus_health) < max_hp:
		current_hp+=bonus_health
		$VBoxContainer/HBoxContainer/MarginContainer2/HealthBar.value = int((float(current_hp)/max_hp)*100)
	else:
		current_hp = max_hp
		$VBoxContainer/HBoxContainer/MarginContainer2/HealthBar.value = max_hp
	pass