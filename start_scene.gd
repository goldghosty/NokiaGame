extends Node2D


var start_lines :Array[String] = [
	"I don't believe in luck.",
	"Most of you think I bring you bad luck.",
	"You don't want me crossing your path?",
	"GOOD. I don't want to see you either.",
	"So I'm on a mission to tempt fate.",
	"Let's spill some salt.",
	"Open umbrellas indoors.",
	"Break mirrors",
	"And destroy these false idols of LUCK!"
]

func _ready() -> void:
	DialogueManager.start_dialogue(start_lines)
	DialogueManager.dialogue_complete.connect(on_dialogue_complete)


func _process(delta: float) -> void:
	pass

#func start_game() -> void:
	#get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")

func on_dialogue_complete():
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
