extends Node

var turn: String = ""
var x_win_count: int = 0
var o_win_count: int = 0
var tie_count: int = 0
var player_1 = ""
var player_2 = ""
var grid_count: int = 0

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

# Check for a win or tie, then add a point to the respective counter and play an animation
func check_if_ended() -> void:
	var array_x: Array = [$"../Main/Xs/X", $"../Main/Xs/X2", $"../Main/Xs/X3", $"../Main/Xs/X4", 
	$"../Main/Xs/X5", $"../Main/Xs/X6", $"../Main/Xs/X7", $"../Main/Xs/X8", $"../Main/Xs/X9"]
	var array_o: Array = [$"../Main/Os/O", $"../Main/Os/O2", $"../Main/Os/O3", $"../Main/Os/O4", 
	$"../Main/Os/O5", $"../Main/Os/O6", $"../Main/Os/O7", $"../Main/Os/O8", $"../Main/Os/O9"]
	var grid: Node2D = $"../Main/Grid"
	var p1_win_count_label: Label = $"../Main/Labels/P1Label/P1WinCount"
	var p2_win_count_label: Label = $"../Main/Labels/P2Label/P2WinCount"
	var tie_count_label: Label = $"../Main/Labels/TieLabel/TieCount"
	var timer: Timer = $"../Main/Timer"
	
	# All possible win conditions (as indices in the array)
	var win_conditions: Array = [
		[0, 1, 2], [3, 4, 5], [6, 7, 8],	# Horizontal
		[0, 3, 6], [1, 4, 7], [2, 5, 8],	# Vertical
		[0, 4, 8], [2, 4, 6]				# Diagonal
	]

	# Check for X win, and if they did win: add a point and play an animation
	for condition in win_conditions:
		if array_x[condition[0]].is_placed and array_x[condition[1]].is_placed and array_x[condition[2]].is_placed:
			x_win_count += 1
			
			if player_1 == "X":
				p1_win_count_label.text = (str(x_win_count))
			elif player_2 == "X":
				p2_win_count_label.text = (str(x_win_count))
				
			array_x[condition[0]].animation_player.play("endgame")
			array_x[condition[1]].animation_player.play("endgame")
			array_x[condition[2]].animation_player.play("endgame")
			
			timer.start()
			
	# Check for O win, and if they did win: add a point and play an animation		
	for condition in win_conditions:
		if array_o[condition[0]].is_placed and array_o[condition[1]].is_placed and array_o[condition[2]].is_placed:
			o_win_count += 1
			
			if player_1 == "O":
				p1_win_count_label.text = str(o_win_count)
			elif player_2 == "O":
				p2_win_count_label.text = str(o_win_count)
				
			array_o[condition[0]].animation_player.play("endgame")
			array_o[condition[1]].animation_player.play("endgame")
			array_o[condition[2]].animation_player.play("endgame")
			
			timer.start()
	
	# Check for tie, and if tied: add to tie count and play an animation
	# TODO: This logic is bad, you can both fill the grid and win at the same time
	if grid_count >= 9:
		tie_count += 1
		tie_count_label.text = str(tie_count)
		grid.animation_player.play("tie")
		
		timer.start()
		
	return
			
# Count how many placements have been made (used as a condition for ties)
func count_grid() -> void:
	grid_count += 1
	
func new_game():
	var array_x: Array = [$"../Main/Xs/X", $"../Main/Xs/X2", $"../Main/Xs/X3", $"../Main/Xs/X4", 
	$"../Main/Xs/X5", $"../Main/Xs/X6", $"../Main/Xs/X7", $"../Main/Xs/X8", $"../Main/Xs/X9"]
	var array_o: Array = [$"../Main/Os/O", $"../Main/Os/O2", $"../Main/Os/O3", $"../Main/Os/O4", 
	$"../Main/Os/O5", $"../Main/Os/O6", $"../Main/Os/O7", $"../Main/Os/O8", $"../Main/Os/O9"]
	
	grid_count = 0
	
	for i in range(len(array_x)):
		array_x[i].is_placed = false
		array_x[i].can_be_placed = true
		array_x[i].sprite_2d.visible = false
		
	for i in range(len(array_o)):
		array_o[i].is_placed = false
		array_o[i].can_be_placed = true
		array_o[i].sprite_2d.visible = false
