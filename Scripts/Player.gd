extends Node2D

const SU_57 = preload("res://Scenes/SU-57.tscn")
const Maingun = preload("res://Scenes/PlayerCannon.tscn")
const Subgun = preload("res://Scenes/SubgunRockets.tscn")
const Drone = preload("res://Scenes/DroneTest.tscn")

var prevMousePos = null
var plane
var health = 3 setget set_health
var speed = 0.2

func _physics_process(delta):
	moving()
	pass

func _ready():
	add_to_group("player")
	position.y = get_viewport().get_visible_rect().size.y/2
	position.x = get_viewport().get_visible_rect().size.x/2
	ready_plane()
	ready_guns()
	ready_drones()
	pass

func ready_drones():
	var droneL = Drone.instance()
#	droneL.global_position = plane.get_node("DronePositionLeft").global_position
	droneL.setTarget(plane.get_node("DronePositionLeft"))
	add_child(droneL)
#	var droneR = Drone.instance()
#	droneR.position = plane.get_node("DronePositionRight").position
#	plane.add_child(droneR)
	pass

func ready_plane():
	plane = SU_57.instance()
	add_child(plane)
	pass
	
func ready_guns():
	var maingun = Maingun.instance()
	maingun.position = plane.get_node("MaingunPosition").position
	add_child(maingun)
	var subgunL = Subgun.instance()
	var subgunR = Subgun.instance()
	subgunL.position = plane.get_node("SubgunPositionLeft").position
	subgunR.position = plane.get_node("SubgunPositionRight").position
	add_child(subgunL)
	add_child(subgunR)
	pass

func moving():
	var currentMousePos = get_global_mouse_position()
	var motion
	if Input.is_action_pressed("player_move"):
		if prevMousePos == null:
			prevMousePos = get_global_mouse_position()
		motion = (currentMousePos - prevMousePos) * speed
		translate(motion)
		prevMousePos = prevMousePos + motion
	elif Input.is_action_just_released("player_move"):
		prevMousePos = null
	pass

func set_health(new_value):
	health = new_value
	if health <= 0: queue_free()
	pass