extends Button



func _on_Button_pressed():
	get_tree().change_scene_to(load('res://Scenes/level1.tscn'))
