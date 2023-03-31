extends Control
func _on_Submit_pressed():
	# Quit
	if get_node("%Username").text == "Secret shutdown":
		get_tree().quit()
	# Reset
	elif get_node("%Code").visible:
		get_node("%Code").visible = false
		get_node("%Error").visible = false
		get_node("%Username").text = ""
		get_node("%Password").text = ""
	# Correct
	elif get_node("%Username").text.to_lower() != "tiberius" or get_node("%Password").text.to_lower() != "#secret*society":
		get_node("%Error").visible = true
	# Error 
	else:
		get_node("%Code").visible = true
		get_node("%Error").visible = false
