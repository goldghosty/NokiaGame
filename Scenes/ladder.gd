extends Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var gone_under = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_exited(body: Node2D) -> void:
	if gone_under == false:
		if body.is_in_group("Player"):
			Global.ladders += 1
			print("earned ladder")
			audio_stream_player_2d.play()
			gone_under = true
