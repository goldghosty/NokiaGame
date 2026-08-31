extends Node2D

var level_completed = false

@onready var mirror_3: Area2D = $Mirror3


var level_three_dialogue :Array[String] = [
	"You forgot to walk under a few ladders.",
	"Wait, I sense something.",
	"Oh no, could it really be?",
	"Okay, listen, you gotta hit him in the head.",
	"He can take a lot of hits.",
	"He likes to throw coins, so watch out.",
	
]

var level_three_best_dialogue :Array[String] = [
	"Who's afraid of walking under a ladder?",
	"NOT US, that's for sure!",
	"Wait, I sense something.",
	"Oh no, could it really be?",
	"Okay, listen, you gotta hit him in the head.",
	"He can take a lot of hits.",
	"He likes to throw coins, so watch out."
	
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.can_shoot = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.enemies_killed == 4:
		Global.level_three_complete = true

	if mirror_3.ready_to_change == true:
		if Global.ladders < 4:
			DialogueManager.start_dialogue(level_three_dialogue)
		else:
			DialogueManager.start_dialogue(level_three_best_dialogue)
		get_tree().change_scene_to_file("res://Scenes/final_level.tscn")
		
	if Global.player_dead == true:
		get_tree().change_scene_to_file("res://death_scene.tscn")
