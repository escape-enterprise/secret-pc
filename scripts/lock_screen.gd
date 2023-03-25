extends Control
func _on_Submit_pressed():
	if get_node("%Code").visible:
		get_node("%Code").visible = false
		get_node("%Error").visible = false
	elif get_node("%Username").text.to_lower() != "tiberius" or get_node("%Password").text.to_lower() != "#secret*society":
		get_node("%Error").visible = true
	else:
		get_node("%Code").visible = true
		get_node("%Error").visible = false
