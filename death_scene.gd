extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_restart_pressed() -> void:
	Global.player_dead = false
	Global.player_health = 3
	Global.enemies_killed = 0
	Global.ladders = 0
	Global.umbrellas_opened = 0
	Global.salt_spilled = 0
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
