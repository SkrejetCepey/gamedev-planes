extends Node2D

const SU_57 = preload("res://Scenes/SU-57.tscn")
const Maingun = preload("res://Scenes/PlayerCannon.tscn")
const Subgun = preload("res://Scenes/SubgunRockets.tscn")
const Drone = preload("res://Scenes/DroneTest.tscn")

var prevMousePos = null
var plane
var droneL
var droneR
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
	droneL = Drone.instance()
	droneL.setTarget(plane.get_node("DronePositionLeft"))
	get_parent().add_child(droneL)
	droneR = Drone.instance()
	droneR.setTarget(plane.get_node("DronePositionRight"))
	get_parent().add_child(droneR)
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
		
	var pos = position
	pos.x = clamp(position.x, 100, get_viewport().get_size().x - 100)
	pos.y = clamp(position.y, 100, get_viewport().get_size().y - 100)
	position = pos
	pass

func self_destruct():
	droneL.queue_free()
	droneR.queue_free()
	queue_free()
	pass