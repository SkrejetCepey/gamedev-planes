extends Control

signal death

onready var HealthBar = $HealthBar
onready var UpdateTween = $UpdateTween
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	HealthBar.value = 100
	pass # Replace with function body.
func health_damaged(damage):
	HealthBar.value = HealthBar.value - damage
	#health = HealthBar.value
	
	UpdateTween.interpolate_property(HealthBar, "value", HealthBar.value, HealthBar.value, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	UpdateTween.start()


func _on_HealthBar_value_changed(value):
	if (value==0):
		emit_signal("death")
	pass # Replace with function body.
