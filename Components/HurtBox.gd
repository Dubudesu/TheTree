class_name HurtBox
extends Area2D

@export var health_component: Node2D

func _init() -> void:
	collision_layer = 0
	collision_mask  = 2

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)
	
	if owner.is_in_group("Tree"):
		collision_mask = 1
		
	
func _on_area_entered(body) -> void:

	var hit_thing = body.owner
	
	if hit_thing.is_in_group("Projectiles"):
		if hit_thing.has_method('hit'):
			hit_thing.hit()
			
	if health_component:
		health_component.take_damage(body.damage)

