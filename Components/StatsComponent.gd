class_name StatsComponent
extends Node

# workaround until dictionary export is fixed!
@export var damage: int = 9
@export var health: int = 300

func _ready() -> void:
	base_stats.damage = damage
	base_stats.health = health
	
	current_stats.damage = calculate_damage()

var current_stats: Dictionary = {
	
	"damage": 2,
	"max_health": 100
}

var base_stats: Dictionary = {
	"damage": 1,
	"health": 10,
}
var level_modifiers: Dictionary = {
	
	
}

var passive_stats = {
	
	"damage_add": 3,
	"damage_mult": 1.6,
	
	"health_add": 0,
	"health_mult": 1.1
}

var item_stats = {
	"damage_add": 0,
	"damage_mult": 1.10,
	
	"health_add": 0,
	"health_mult": 1.1
}

var temp_stats = {
	"damage_add": 0,
	"damage_mult": 1.0,
	
	"health_add": 0,
	"health_mult": 1.1
}


# Calculations

func calculate_damage() -> float:
	var damage = ( (base_stats.damage 
		+ passive_stats.damage_add
		+ item_stats.damage_add
		+ temp_stats.damage_add ) 
		* passive_stats.damage_mult
		* item_stats.damage_mult
		* temp_stats.damage_mult
		)
	return damage
	pass
