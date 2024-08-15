extends Control

var chose_x: bool = false

func _on_choice_x_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	chose_x = true

func _on_choice_o_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func _on_choice_x_mouse_entered():
	$ChoiceX.grab_focus()

func _on_choice_o_mouse_entered():
	$ChoiceO.grab_focus()

func _on_choice_x_mouse_exited():
	$ChoiceX.release_focus()
	
func _on_choice_o_mouse_exited():
	$ChoiceO.release_focus()
