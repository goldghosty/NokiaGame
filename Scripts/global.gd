extends Node

var can_shoot = true
var player_health: int = 3
var level_one_complete = false
var level_two_complete = false
var level_three_complete = false
var level_four_complete = false
var ladders = 0
var umbrellas_opened = 0
var salt_spilled = 0
var enemies_killed = 0
var player_dead : bool = false
var tutorial_done: bool = false

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if player_health <= 0:
		player_dead = true
	
