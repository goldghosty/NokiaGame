extends Node2D

var level_completed = false

@onready var mirror: Area2D = $Objects/Mirror

var level_one_dialogue :Array[String] = [
	"Seems like we didn't spill all of the salt.",
	"At least we got those pesky clovers.",
	"Ooh, this is the umbrella room!",
	"But those silly rabbits too.",
	"Let's show them what's up."
	
]

var level_one_best_dialogue :Array[String] = [
	"Yes, we spilled all of the salt!",
	"And ripped the leaves off those clovers!",
	"Ooh, this is the umbrella room!",
	"But those silly rabbits too.",
	"Let's show them what's up."
	
]

var tutorial_dialogue :Array[String] = [
	"Okay, let me give you a quick rundown.",
	"Move left and right with arrow keys.",
	"Use X to interact with items.",
	"Use Z to shoot a big hairball.",
	"Hairballs do need to charge up though.",
	"I'll tell you when I'm ready again.",
	"Use space bar to jump, duh.",
	"Down arrow to go thru platforms.",
	"Hairballs break mirrors to the next level.",
	"BUT only if you've beat all the enemies.",
	"That should do it, let's gooooo!"
	
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.start_dialogue(tutorial_dialogue)
	Global.can_shoot = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.enemies_killed == 4:
		Global.level_one_complete = true

	if mirror.ready_to_change == true:
		if Global.salt_spilled < 6:
			DialogueManager.start_dialogue(level_one_dialogue)
		else:
			DialogueManager.start_dialogue(level_one_best_dialogue)
		get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
		
	if Global.player_dead == true:
		get_tree().change_scene_to_file("res://death_scene.tscn")
		
