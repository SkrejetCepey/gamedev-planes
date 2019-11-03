extends Area2D

const Bullet = preload("res://scenes/PlayerProjectile.tscn")

var health = 3 setget set_health

func _physics_process(delta):
	moving()
	pass

func _ready():
	add_to_group("player")
	position.y = 550
	position.x = 250
	shooting()
	pass

func moving():
	var speed = 0.2;
	var motion = (get_global_mouse_position().x - position.x) * speed
	if Input.is_action_pressed("player_move"):
		translate(Vector2(motion, 0))
	pass

func shooting():
	while true:
		var bullet = Bullet.instance()
		bullet.start($PlayerCannonPosition.get_global_position())
		get_parent().add_child(bullet)
		yield(get_tree().create_timer(0.2), "timeout")
	pass
	
func set_health(new_value):
	health = new_value
	if health <= 0: queue_free()
	pass