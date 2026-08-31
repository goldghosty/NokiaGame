extends CanvasLayer

@onready var restart: Button = $ColorRect/Restart
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restart.grab_focus()
	audio_stream_player_2d.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_restart_pressed() -> void:
	Global.player_health = 3
	Global.level_one_complete = false
	Global.level_two_complete = false
	Global.level_three_complete = false
	Global.ladders = 0
	Global.umbrellas_opened = 0
	Global.salt_spilled = 0
	Global.enemies_killed = 0
	Global.player_dead = false
	Global.neko_is_dead = false
	Global.lucky_cat_health = 5
	DialogueManager.original_speaker()
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
