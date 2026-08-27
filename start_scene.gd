extends Node2D

var start_lines :Array[String] = [
	"I don't believe in luck.",
	"Most of you think I bring you bad luck.",
	"You don't want me crossing your path?",
	"GOOD. I don't want to see you either."
]

func _ready() -> void:
	DialogueManager.start_dialogue(start_lines)
	start_game()


func _process(delta: float) -> void:
	pass

func start_game() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
