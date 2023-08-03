class_name Projectile
extends Node2D

var speed = 200
var direction: Vector2

var pierce = 0


func init(target) -> void:
	var angle = position.direction_to(target.position)
	direction = angle
	


func _process(delta):
	global_position += speed * direction * delta
	rotation += 3*PI*delta

func hit() -> void:
	if pierce > 0:
		pierce -= 1
	else:
		destroy()

func destroy() -> void:
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	destroy()
