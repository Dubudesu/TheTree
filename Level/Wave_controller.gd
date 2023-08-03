extends Node2D

@onready var baddie: PackedScene
@onready var tree: Node
var wave_baddies = []

const max_enemies = 30

func _ready() -> void:
	baddie = load("res://Baddies/Termite_0/Termite.tscn")
	tree = get_node("../Tree_0")
	
	randomize()
	
	print("The bugs are coming")
	await get_tree().create_timer(3.0).timeout
	start_wave(GameData.data.CurrentWave)


func instantiate_baddies(wave_count) -> void:	
	for each in wave_count:
		wave_baddies.push_back(baddie.instantiate())

func increment_wave() -> void:
	var g = GameData.data
	g.CurrentWave += 1

	if g.CurrentWave > g.MaxWave:
		g.MaxWave = g.CurrentWave
		

func start_wave(wave: int) -> void:
	
	print("Starting wave: ", wave, " in 5 seconds...")
	await get_tree().create_timer(5.0).timeout
	print("Wave ", wave, " starting!")
	get_node("Baddie_Timer").start()
	instantiate_baddies(10 + floor( wave/10 ))
	print("Releasing: ", wave_baddies.size() , " baddies this wave!")


func _on_baddie_timer_timeout():
	# Create a new instance of the Mob scene.
	if wave_baddies.size() > 0:
		if get_tree().get_nodes_in_group("Baddies").size() < max_enemies:
			var next_baddie = wave_baddies.pop_back()
			# Choose a random location on Path2D.
			var mob_spawn_location = get_node("Baddie_Path/PathFollow2D")
			mob_spawn_location.progress = randi()
			next_baddie.position = mob_spawn_location.position

			# Spawn the mob by adding it to the Main scene.
			next_baddie.init(tree)
			add_child(next_baddie)
			
		else:
			print("max enemies reached!")
	else:
		if get_tree().get_nodes_in_group("Baddies").size() > 0:
			print("finish killing to go to next wave!")
		else:
			get_node("Baddie_Timer").stop()
			
			if GameData.data.AutoProgress:
				increment_wave()
			start_wave(GameData.data.CurrentWave)


func _on_auto_progress_toggled(button_pressed):
	GameData.data.AutoProgress = button_pressed
