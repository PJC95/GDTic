extends Control
@onready var button = $Button

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.grab_focus()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
