class_name HealthComponent
extends Node2D

@export var default_max_health:= 100

@onready var stats = get_node_or_null("../StatsComponent")

var current_health
var max_health

signal health_changed(ohp, chp)
signal health_setup(mhp, chp)
signal dead

func _ready() -> void:
	
	#should i just assume stat compenent exists??? idk
	if stats:
		# caclulate max health?
		max_health = calculate_max_health()
		print("base health: ", stats.base_stats.health, ". total health: ", max_health)
	else:
		print("no stats component! using default values...")
		max_health = default_max_health
	
	randomize()
	current_health = max_health
	emit_signal("health_setup", max_health, current_health)
	

func take_damage(amount):
	var old_health = current_health
	current_health -= amount
	emit_signal("health_changed", old_health, current_health)
	
	if current_health <= 0:
		die()
		
func die() -> void:
	emit_signal("dead")


func calculate_max_health() -> float:
	var health: float
	
	health = ( (stats.base_stats.health 
		+ stats.passive_stats.health_add
		+ stats.item_stats.health_add
		+ stats.temp_stats.health_add ) 
		* stats.passive_stats.health_mult
		* stats.item_stats.health_mult
		* stats.temp_stats.health_mult
		)
	
	return health
	
