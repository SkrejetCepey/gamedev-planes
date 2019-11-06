extends Control

signal death

export var MaxHealth = 100

onready var HealthBar = $HealthBar
onready var UpdateTween = $UpdateTween
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#HealthBar.value = MaxHealth
	HealthBar.hide()
	pass # Replace with function body.
func health_damaged(damage):
	HealthBar.show()
	HealthBar.value = HealthBar.value - damage
	#health = HealthBar.value
	print("Took damage:", damage)
	UpdateTween.interpolate_property(HealthBar, "value", HealthBar.value, HealthBar.value, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	UpdateTween.start()
	
func health_setup(MaxHealth):
	HealthBar.value=MaxHealth
	HealthBar.hide()
	print("Health setted:", MaxHealth)
	pass

func _on_HealthBar_value_changed(value):
	if (value==0):
		emit_signal("death")
	pass # Replace with function body.
