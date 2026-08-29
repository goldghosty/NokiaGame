extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var start_lines :Array[String] = [
	"I don't believe in luck.",
	"Most of you think I bring you bad luck.",
	"You don't want me crossing your path?",
	"GOOD. I don't want to see you either.",
	"So I'm on a mission to tempt fate.",
	"Let's spill some salt!",
	"Open some umbrellas indoors!",
	"Break all the mirrors!",
	"And destroy these false idols of LUCK!"
]

func _ready() -> void:
	animated_sprite_2d.visible = false
	DialogueManager.start_dialogue(start_lines)
	DialogueManager.dialogue_complete.connect(on_dialogue_complete)


func _process(delta: float) -> void:
	pass

#func start_game() -> void:
	#get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")

func on_dialogue_complete():
	animated_sprite_2d.visible = true
	animated_sprite_2d.play("default")
	await animated_sprite_2d.animation_finished
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
