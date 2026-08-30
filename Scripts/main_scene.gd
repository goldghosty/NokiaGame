extends Node2D

var level_completed = false
@onready var mirror: Area2D = $Mirror
@export var next_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.enemies_killed == 4:
		Global.level_one_complete = true

	if mirror.ready_to_change == true:
		get_tree().change_scene_to_file(next_scene.resource_path)
