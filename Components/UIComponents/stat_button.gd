extends TextureRect

var P = GameData.passive_levels

@onready var stat = get_node("Stat").text.to_lower()

signal StatsChanged

# Called when the node enters the scene tree for the first time.
func _ready():

	get_node("Level").text = str(P[stat].level)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cost_pressed():
	print("Increasing ", stat, " by 1...")
	
	P[stat].level += 1
	get_node("Level").text = str(P[stat].level)
	
	print("Current level: ", P[stat].level)
	
	emit_signal("StatsChanged")
	pass # Replace with function body.
