extends Timer

func _on_timeout():
	GameManager.new_game()
