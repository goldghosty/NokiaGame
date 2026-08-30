extends Node2D

var level_completed = false
@export var next_scene :PackedScene
@onready var mirror_2: Area2D = $Mirror2


var level_two_dialogue :Array[String] = [
	"We missed a few of those umbrellas.",
	"The next room has ladders to walk under.",
	"And those stupid six sided objects.",
	"Let's venture forth!"
	
]

var level_two_best_dialogue :Array[String] = [
	"Yes, we opened all of the umbrellas!",
	"The next room has ladders to walk under.",
	"And those stupid six sided objects.",
	"Let's venture forth!"
	
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.can_shoot = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.enemies_killed == 9:
		Global.level_two_complete = true

	if mirror_2.ready_to_change == true:
		if Global.umbrellas_opened < 6:
			DialogueManager.start_dialogue(level_two_dialogue)
		else:
			DialogueManager.start_dialogue(level_two_best_dialogue)
		get_tree().change_scene_to_file(next_scene.resource_path)
