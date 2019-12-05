extends Control

signal death

#export var MaxHealth = 100

onready var HealthBar = $HealthBar
onready var UpdateTween = $UpdateTween

func _ready():
	HealthBar.hide()
	pass 

func health_damaged(damage):
	#if (HealthBar.hide()==true):
	HealthBar.show()
	HealthBar.value = HealthBar.value - damage
	#print("HealthValue", HealthBar.value)
	#UpdateTween.interpolate_property(HealthBar, "value", HealthBar.value, HealthBar.value, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	#UpdateTween.start()
	
func health_setup(MaxHealth):
	#HealthBar.max_value=MaxHealth
	#$HealthBar.Range.max_value = MaxHealth
	$HealthBar.max_value=MaxHealth
	HealthBar.value=MaxHealth
	#print("HealthBar.max_value ",$HealthBar.max_value)
	HealthBar.hide()
	pass

func _on_HealthBar_value_changed(value):
	if (value==0):
		emit_signal("death")
	pass