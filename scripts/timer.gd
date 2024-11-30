extends Timer

func _on_timeout() -> void:
	GameManager.new_game()
