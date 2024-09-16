extends Control

# If X is chosen, change to main game scene with X taking the first turn
func _on_choice_x_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	GameManager.turn = "X"
	GameManager.player_1 = "X"
	GameManager.player_2 = "O"

# If O is chosen, change to main game scene with O taking the first turn
func _on_choice_o_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	GameManager.turn = "O"
	GameManager.player_1 = "O"
	GameManager.player_2 = "X"
	
func _on_choice_x_mouse_entered() -> void:
	$ChoiceX.grab_focus()

func _on_choice_o_mouse_entered() -> void:
	$ChoiceO.grab_focus()

func _on_choice_x_mouse_exited() -> void:
	$ChoiceX.release_focus()
	
func _on_choice_o_mouse_exited() -> void:
	$ChoiceO.release_focus()
