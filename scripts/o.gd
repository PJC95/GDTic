extends Node2D

@onready var sprite_2d: Sprite2D = $Area2D/Sprite2D
@onready var timer: Timer = $Timer

var left_mouse_pressed: bool = false
var mouse_in_area: bool = false

# Set node to be invisible by default
func _ready() -> void:
	sprite_2d.visible = false

# Checks if left mouse button is currently pressed during each frame
func _input(InputEvent) -> void:
	if InputEvent is InputEventMouseButton:
		if InputEvent.button_index == MOUSE_BUTTON_LEFT:
			left_mouse_pressed = InputEvent.pressed
			
# If cursor is in node's area, left mouse is pressed and it's O's turn, make the sprite visible
func _process(_delta) -> void:
	if mouse_in_area and left_mouse_pressed and GameManager.turn == "O":
		sprite_2d.visible = true
		timer.start()
		
func _on_area_2d_mouse_entered() -> void: 
	mouse_in_area = true
	
func _on_area_2d_mouse_exited() -> void:
	mouse_in_area = false

func _on_timer_timeout() -> void:
	GameManager.turn = "X"
