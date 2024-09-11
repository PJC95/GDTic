extends Node

var turn: String = ""

# Checks if O or X is placed on a grid space; if so, blocks opposite from being placed there
func check_if_placed() -> void:
	var array_x: Array = [$"../Main/Xs/X", $"../Main/Xs/X2", $"../Main/Xs/X3", $"../Main/Xs/X4", 
	$"../Main/Xs/X5", $"../Main/Xs/X6", $"../Main/Xs/X7", $"../Main/Xs/X8", $"../Main/Xs/X9"]
	var array_o: Array = [$"../Main/Os/O", $"../Main/Os/O2", $"../Main/Os/O3", $"../Main/Os/O4", 
	$"../Main/Os/O5", $"../Main/Os/O6", $"../Main/Os/O7", $"../Main/Os/O8", $"../Main/Os/O9"]

	# If an X has been placed on the grid, an O cannot be placed in the same spot
	for i in range(len(array_x)):
		if array_x[i].is_placed:
			array_o[i].can_be_placed = false
			
	# If an O has been placed on the grid, an X cannot be placed in the same spot
	for i in range(len(array_o)):
		if array_o[i].is_placed:
			array_x[i].can_be_placed = false
