extends Control

onready var HealthBar = $HealthBar
onready var UpdateTween = $UpdateTween
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	HealthBar.value = 100
	pass # Replace with function body.
func health_updated(health, damage):
	HealthBar.value = health - damage
	health = HealthBar.value
	
	UpdateTween.interpolate_property(HealthBar, "value", HealthBar.value, health, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	UpdateTween.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
