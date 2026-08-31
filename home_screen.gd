extends CanvasLayer

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var button: Button = $Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.grab_focus()
	audio_stream_player_2d.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/start_scene.tscn")
