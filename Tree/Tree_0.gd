extends StaticBody2D

#var hp = get_node("../Health")
# Called when the node enters the scene tree for the first time.
func take_damage(damage) -> void:
	print("tree damage: ", damage)
	pass


func _on_health_component_dead():
	print("You died!")
	get_tree().paused = !get_tree().paused


func _on_health_component_health_changed(ohp, chp):
	pass
	var dmg = ohp - chp
	print("Took: ", dmg, ", current hp: ", chp)
