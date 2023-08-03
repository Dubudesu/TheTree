class_name HealthBarComponent
extends Node

func _on_health_component_health_changed(ohp, chp):
	$Node2D/ProgressBar.show()
	$Node2D/ProgressBar.value = chp

func _on_health_component_health_setup(mhp, chp):
	$Node2D/ProgressBar.max_value = mhp
	$Node2D/ProgressBar.value = chp
