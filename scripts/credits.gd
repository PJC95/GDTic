extends Control
@onready var button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.grab_focus()

# If "back" button clicked, return to menu
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
# If escape key pressed, return to menu
func _input(event) -> void:
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
