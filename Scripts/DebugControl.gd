extends MarginContainer

func _physics_process(delta):
	$HBoxContainer/VBoxContainer/FPSControl.text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS))
	$HBoxContainer/VBoxContainer/MemoryControl.text = "StaticMemory: " + str(round(Performance.get_monitor(Performance.MEMORY_STATIC)/1024/1024)) + "/" + str(round(Performance.get_monitor(Performance.MEMORY_STATIC_MAX)/1024/1024)) + " MB"
	pass