extends Control


func _on_resource_update_timer_timeout():
	
	$Chlorophyll/Amount.text = str(GameData.data.Chlorophyll)
	$Nutrients/Amount.text = str(GameData.data.Nutrients)
