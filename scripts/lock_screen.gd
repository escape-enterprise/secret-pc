extends Control
var unlock_timestamp := 0
var reset_delay_m := 20
func _physics_process(delta):
	if Input.is_action_just_released("ui_accept"):
		_on_Submit_pressed()
	# time since unlock > delay in minutes * to seconds * to milliseconds
	if get_node("%Code").visible and (OS.get_system_time_msecs() - unlock_timestamp > reset_delay_m * 60000):
		clear(false)
		
func _on_Submit_pressed():
	# Reset error
	get_node("%Error").visible = false
	
	# Check for reset
	if get_node("%Code").visible:
		clear(false)
		return
	
	# Check username matching
	match get_node("%Username").text.to_lower().strip_edges():
		# Correct
		"tiberius":
			if get_node("%Password").text.to_lower().strip_edges() == "#secret*society":
				get_node("%Code").visible = true
				unlock_timestamp = OS.get_system_time_msecs()
				return
		
		# Shutdown
		"~~~":
			get_tree().quit()
			return
			
		"":
			clear(false)
			return

	clear(true)

func clear(error):
	get_node("%Error").visible = error
	get_node("%Code").visible = false
	get_node("%Username").text = ""
	get_node("%Username").grab_focus()
	get_node("%Password").text = ""
