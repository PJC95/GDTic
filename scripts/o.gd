extends Node2D

var left_mouse_pressed: bool = false
var mouse_in_area: bool = false

# Set node to be invisible by default
func _ready() -> void:
	$Area2D/Sprite2D.visible = false

# Checks if left mouse button is currently pressed during each frame
func _input(InputEvent) -> void:
	if InputEvent is InputEventMouseButton:
		if InputEvent.button_index == MOUSE_BUTTON_LEFT:
			left_mouse_pressed = InputEvent.pressed
			
# If cursor is in node's area and left mouse is pressed, make the sprite visible
func _process(_delta) -> void:
	if mouse_in_area and left_mouse_pressed and GameManager.chose_x == false:
		$Area2D/Sprite2D.visible = true
		
func _on_area_2d_mouse_entered() -> void:
	mouse_in_area = true
	
func _on_area_2d_mouse_exited() -> void:
	mouse_in_area = false
