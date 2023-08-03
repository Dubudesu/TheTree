class_name MeleeAttackComponent
extends Node

@onready var stats = get_node_or_null("../StatsComponent")
@onready var anim = get_node("../AnimationPlayer")

@export var attack_speed: float = 1.0
var attack_delay = 1/attack_speed
var attack_scale = 1
var attack_length

# Called when the node enters the scene tree for the first time.
func _ready():
	var attack_length = anim.get_animation("Attack").length
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func attack() -> void:
	#attack scale = attack_length * attack_speed
	attack_scale = attack_length*attack_speed
	print(attack_scale)
	
	#anim.play('Attack')
	#anim.set_speed_scale(attack_scale)
