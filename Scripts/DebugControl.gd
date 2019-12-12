extends MarginContainer

func _physics_process(delta):
	$HBoxContainer/VBoxContainer/Date.text = "Date OS: " + str(OS.get_date()["day"]) + "." + str(OS.get_date()["month"]) + "." + str(OS.get_date()["year"])
	$HBoxContainer/VBoxContainer/Video_driver_name.text = "Video_driver_name OS: " + str(OS.get_video_driver_name(OS.get_current_video_driver()))
	$HBoxContainer/VBoxContainer/Name.text = "Name OS: " + str(OS.get_name())
	$HBoxContainer/VBoxContainer/OS.text = "OS: " + str(OS.get_model_name())
	$HBoxContainer/VBoxContainer/FPSControl.text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS))
	$HBoxContainer/VBoxContainer/MemoryControl.text = "StaticMemory: " + str(round(Performance.get_monitor(Performance.MEMORY_STATIC)/1024/1024)) + "/" + str(round(Performance.get_monitor(Performance.MEMORY_STATIC_MAX)/1024/1024)) + " MB"
	pass