extends Node2D

var level_completed = false
@onready var mirror_2: Area2D = $Mirror2



@export var next_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.can_shoot = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.enemies_killed == 9:
		Global.level_two_complete = true

	if mirror_2.ready_to_change == true:
		get_tree().change_scene_to_file(next_scene.resource_path)
