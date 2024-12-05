extends Node2D

@onready var sprite_2d: Sprite2D = $Area2D/Sprite2D
@onready var is_placed: bool = false
@onready var can_be_placed: bool = true
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var left_mouse_pressed: bool = false
var mouse_in_area: bool = false

# Called when the node enters the scene tree for the first time.
# Sets the node to be invisible by default
func _ready() -> void:
	sprite_2d.visible = false

# Checks if left mouse button is pressed
func _input(event) -> void:
	if event.is_action_pressed("select"):
		left_mouse_pressed = true
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if mouse_in_area and left_mouse_pressed and can_be_placed and GameManager.turn == "O":
		sprite_2d.visible = true
		is_placed = true
		GameManager.turn = "X"
		GameManager.check_if_placed()
		GameManager.count_grid()
		GameManager.check_if_ended()
		
		if GameManager.can_be_played == true:
			audio_stream_player_2d.play()
	
	left_mouse_pressed = false
		
func _on_area_2d_mouse_entered() -> void: 
	mouse_in_area = true
	
func _on_area_2d_mouse_exited() -> void:
	mouse_in_area = false
