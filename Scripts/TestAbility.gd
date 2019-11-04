extends Area2D

export var speed = 100
var velocity = Vector2()

func _physics_process(delta):
	velocity.y = speed * delta
	translate(velocity)
	pass
	
func _ready():
	queue_free()
	pass

func drop_abiliti():
	$TestAbility.instance()
	$TestAbility.position = $DeathPos.position
	pass 

func _on_Visible_screen_exited():
	queue_free()
	pass 