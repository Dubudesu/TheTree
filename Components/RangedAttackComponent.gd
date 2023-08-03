class_name RangedAttackComponent
extends Node

@export var targeting: Node2D
@export var projectile: PackedScene

@onready var stats = get_node_or_null("../StatsComponent")

@export var attack_speed: float = 1.8
var attack_delay = 1/attack_speed



# Called when the node enters the scene tree for the first time.
func _ready():
	print("readying guns")
	var attack_timer = Timer.new()
	attack_timer.set_wait_time(attack_delay)
	print(attack_timer.get_wait_time())
	attack_timer.connect("timeout", _on_attack_timer_timeout)
	
	add_child(attack_timer) #to process
	attack_timer.start() #to start	

func _on_attack_timer_timeout() -> void:
	var target = targeting.get_nearest()
	#var target = targeting.get_weakest()
	if target:
		var p = projectile.instantiate()
		
		p.position = owner.position
		p.init(target)
		# This component should calculate the outgoing damage from the 
		# stats_component of its owner
		p.get_node("HitBox").set_damage( stats.current_stats.damage ) 
		
		add_child(p)

func calculate_projectile_damage() -> float:
	
	var damage = ( (stats.base_stats.damage 
		+ stats.passive_stats.damage_add
		+ stats.item_stats.damage_add
		+ stats.temp_stats.damage_add ) 
		* stats.passive_stats.damage_mult
		* stats.item_stats.damage_mult
		* stats.temp_stats.damage_mult
		)
	print("base damage: ", stats.base_stats.damage , ". total damage: ", damage)
	return damage
	pass
