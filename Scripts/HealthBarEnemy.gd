extends Control

signal death

var max_hp
var current_hp

onready var HealthBar = $HealthBar
onready var UpdateTween = $UpdateTween

func _ready():
	$HealthBar.hide()
	pass 

func health_damaged(damage):
	$HealthBar.show()
	current_hp-=damage
	$HealthBar.value = int((float(current_hp)/max_hp)*100)
	
func health_setup(MaxHealth):
	$HealthBar.value = MaxHealth
	max_hp = MaxHealth
	current_hp = max_hp
	pass

func _on_HealthBar_value_changed(value):
	if (value==0):
		emit_signal("death")
	pass