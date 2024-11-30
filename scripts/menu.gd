extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/choose_side.tscn")
	
func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

# If escape key pressed, quit game
func _input(event) -> void:
	if event.is_action_pressed("escape"):
		get_tree().quit()
