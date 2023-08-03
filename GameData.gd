extends Node

var data = {
	Chlorophyll 	= 0,
	Nutrients 	= 0,
	MaxWave 	= 0,
	CurrentWave = 2,
	AutoProgress = true
}



var passive_levels: Dictionary = {
	"damage": {
		"level": 0,
		"max": 10000,
		"base_cost": 10,
		"cost_mod": 20
	}
}
