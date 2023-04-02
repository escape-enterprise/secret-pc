extends Control
func _on_Submit_pressed():
	# Reset error
	get_node("%Error").visible = false
	
	# Check for reset
	if get_node("%Code").visible:
		clear(false)
		return
	
	# Check username matching
	match get_node("%Username").text.to_lower():
		# Correct
		"tiberius":
			if get_node("%Password").text.to_lower() == "#secret*society":
				get_node("%Code").visible = true
				return
		
		# Shutdown
		"secret shutdown":
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
	get_node("%Password").text = ""
