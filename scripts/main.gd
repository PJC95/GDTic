extends Node2D

@onready var array_x: Array = [$Xs/X, $Xs/X2, $Xs/X3, $Xs/X4, $Xs/X5, $Xs/X6, $Xs/X7, $Xs/X8, $Xs/X9]
@onready var array_o: Array = [$Os/O, $Os/O2, $Os/O3, $Os/O4, $Os/O5, $Os/O6, $Os/O7, $Os/O8, $Os/O9]

func _process(_delta) -> void:
	for i in range(len(array_x)):
		if array_x[i].is_placed == true:
			array_o[i].can_be_placed = false
			
	for i in range(len(array_o)):
		if array_o[i].is_placed == true:
			array_x[i].can_be_placed = false
			
# func _process(delta):
	# var mouse_position: Vector2 = get_viewport().get_mouse_position()
	# print(mouse_position)
