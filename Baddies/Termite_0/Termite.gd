extends CharacterBody2D

var target
var motion = Vector2(randf_range(100.0, 150.0), 0.0)
var stop = false
var anim

var base_chlorophyll = 1
var base_nutrients = 5

var base_chlorophyll_chance = 0.2

func init(t):
	if t:
		target = t
	else: target = Vector2(randf_range(0,300),randf_range(0,300) )

func _ready():
	anim = get_node("AnimationPlayer")
	anim.play('Walk')

	
func _physics_process(delta):
	var angle = position.direction_to(target.position).angle()
	var collider = move_and_collide(velocity * delta)
	
	if !stop:
		velocity = motion.rotated( angle )
		set_rotation(angle + PI/2)
	
	if collider:
		# if termite has hit the target (tree)
		if collider.get_collider().get_collision_layer() == 1:
			if !stop:
				anim.play('Attack')
				anim.set_speed_scale((6)*anim.get_animation("Attack").length)
				
				print("anim scale = ", (6)*anim.get_animation("Attack").length )
			stop = true
			velocity = motion * 0


func _on_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed('KILL'):
		die()

func _on_health_component_dead():
	die()

func die() -> void:
	randomize()
	
	var d = GameData.data
	var randomNumber = randf_range(0,1)
	
	if randomNumber <= base_chlorophyll_chance:
		d["Chlorophyll"] += floor(base_chlorophyll * (1+ d["CurrentWave"]/50) )
		
	d["Nutrients"] += floor(base_nutrients * (1+ d.CurrentWave/10) )
	
	queue_free()
