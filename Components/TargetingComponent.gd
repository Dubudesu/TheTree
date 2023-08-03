class_name Targeting
extends Node2D

	
func get_nearest():
	var closest_baddie
	var shortest_distance = INF
	for baddie in get_tree().get_nodes_in_group("Baddies"):
		if not is_instance_valid(baddie):
			continue
		var distance = owner.position.distance_to(baddie.position)
		if distance < shortest_distance:
			shortest_distance = distance
			closest_baddie = baddie
	return closest_baddie

func get_weakest():
	var weakest_baddie
	var lowest_hp = INF
	for baddie in get_tree().get_nodes_in_group("Baddies"):
		if not is_instance_valid(baddie):
			continue
		var hp = baddie.get_node_or_null("HealthComponent")
		if hp:
			if hp.current_health < lowest_hp:
				lowest_hp = hp.current_health
				weakest_baddie = baddie
	return weakest_baddie
	
func get_strongest():
	var strongest_baddie
	var highest_hp = 0
	for baddie in get_tree().get_nodes_in_group("Baddies"):
		if not is_instance_valid(baddie):
			continue
		var hp = baddie.get_node_or_null("HealthComponent")
		if hp:
			if hp.current_health > highest_hp:
				highest_hp = hp.current_health
				strongest_baddie = baddie
	return strongest_baddie
