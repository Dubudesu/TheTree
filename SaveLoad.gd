extends Node

const SAVE_PATH = "res://save.json"

func _ready() -> void:
	load_game()
	print( GameData.data )

func save_game() -> void:
	
	var save_dict = GameData.data
	
	var save_file = FileAccess.open(SAVE_PATH,FileAccess.WRITE)
	
	var json = JSON.new()
	var json_string = json.stringify(save_dict)
	
	save_file.store_line(json_string)
	

	print("Game saved to: ", SAVE_PATH)
	
	save_file = null
	
func load_game() -> void:
	var data = {}
	

	var save_file = FileAccess.open(SAVE_PATH,FileAccess.READ)
	if !FileAccess.file_exists(SAVE_PATH):
		print("No save to load!")
		return
		
	#data.parse_json(save_file.get_as_text())
	data = JSON.parse_string(save_file.get_as_text())
	GameData.data = data
	
	save_file = null
