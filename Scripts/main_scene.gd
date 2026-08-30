extends Node2D

var level_completed = false
@onready var mirror: Area2D = $Objects/Mirror

@export var next_scene : PackedScene


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
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.can_shoot = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.enemies_killed == 4:
		Global.level_one_complete = true

	if mirror.ready_to_change == true:
		if Global.rewards_earned < 6:
			DialogueManager.start_dialogue(level_one_dialogue)
		else:
			DialogueManager.start_dialogue(level_one_best_dialogue)
		get_tree().change_scene_to_file(next_scene.resource_path)
