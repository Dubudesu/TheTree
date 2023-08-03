class_name HitBox
extends Area2D

@export var damage: float = 10.0

func set_damage(d: float):
	damage = d

func _init() -> void:
	collision_layer = 2
	collision_mask  = 0
	
func _ready() -> void:
	if owner.is_in_group("Baddies"):
		collision_layer = 1
