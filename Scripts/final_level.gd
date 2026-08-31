extends Node2D
@onready var lucky_cat: CharacterBody2D = $LuckyCat
@onready var canvas_layer: CanvasLayer = $CanvasLayer

var final_dialogue :Array[String] = [
	"Lucky Cat, I don't like this battle.",
	"We should be friends, not enemies!",
	"Aren't you tired of all this fake luck too?",
	"Luck's got nothing to do with us!",
	
]

var neko_dialogue :Array[String] = [
	"I suppose it is all a bit silly.",
	"Maybe we can break the cycle.",
	"Good luck, bad luck - who needs it?",
	"Plus, cats SHOULD stick together.",
]

#var dialogue_started : bool = false

func _ready() -> void:
	Global.can_shoot = true
	lucky_cat.neko_dead.connect(start_first_dialogue)
	canvas_layer.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.player_dead == true:
		get_tree().change_scene_to_file("res://death_scene.tscn")

	#if Global.neko_is_dead and dialogue_started == false:
		#dialogue_started = true
		#start_first_dialogue()
		

func start_first_dialogue():
	canvas_layer.visible = true
	DialogueManager.start_dialogue(final_dialogue)		
	DialogueManager.dialogue_complete.connect(start_neko_dialogue, CONNECT_ONE_SHOT)
	
func start_neko_dialogue():
	await get_tree().create_timer(0.1).timeout
	DialogueManager.change_speaker()
	DialogueManager.start_dialogue(neko_dialogue)
	DialogueManager.dialogue_complete.connect(end_game)
	
func end_game():
	get_tree().change_scene_to_file("res://end_scene.tscn")
