extends Control

func _on_choice_x_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	GameManager.turn = "X"

func _on_choice_o_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func _on_choice_x_mouse_entered() -> void:
	$ChoiceX.grab_focus()

func _on_choice_o_mouse_entered() -> void:
	$ChoiceO.grab_focus()

func _on_choice_x_mouse_exited() -> void:
	$ChoiceX.release_focus()
	
func _on_choice_o_mouse_exited() -> void:
	$ChoiceO.release_focus()
