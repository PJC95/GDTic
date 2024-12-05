extends Node2D

@onready var p1_label: Label = $Labels/P1Label
@onready var p2_label: Label = $Labels/P2Label
@onready var button: Button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	p1_label.text = "Player 1 (" + str(GameManager.player_1) + ")"
	p2_label.text = "Player 2 (" + str(GameManager.player_2) + ")"
	
	GameManager.x_win_count = 0
	GameManager.o_win_count = 0
	GameManager.tie_count = 0
	GameManager.grid_count = 0
	
	GameManager.neutral_theme()
	button.grab_focus()

# If "back" button clicked, return to "choose side" screen
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/choose_side.tscn")
	
# If escape key pressed, return to "choose side" screen
func _input(event) -> void:
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/choose_side.tscn")
