extends Node

#@export var termite: PackedScene
func _ready() -> void:
	$AutoProgress.button_pressed = GameData.data.AutoProgress

func _on_save_timer_timeout():
	SaveLoad.save_game()
