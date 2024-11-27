extends Node2D

@onready var p1_label = $Labels/P1Label
@onready var p2_label = $Labels/P2Label

# Called when the node enters the scene tree for the first time.
func _ready():
	p1_label.text = "Player 1 (" + str(GameManager.player_1) + ")"
	p2_label.text = "Player 2 (" + str(GameManager.player_2) + ")"
	
	GameManager.good_theme()
