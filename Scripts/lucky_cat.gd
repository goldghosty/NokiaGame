extends CharacterBody2D
@onready var attack_timer: Timer = $AttackTimer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


@onready var marker_2d: Marker2D = $Marker2D

var projectile_enemy = preload("res://Scenes/lucky_cat_projectile.tscn")
var speed: float = 5
var distance: float = 7
var y_direction : int = 1
var shoot_direction = -1
var start_y : float
var player : Node2D


func _ready() -> void:
	start_y = global_position.y
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta: float) -> void:
	
	velocity.y = speed * y_direction
	move_and_slide()

	if global_position.y > start_y + distance:
		y_direction = -1
	elif global_position.y < start_y - distance:
		y_direction = 1
	
	if player:
		if player.global_position.x < global_position.x:
			animated_sprite_2d.flip_h = false
			marker_2d.position.x = abs(marker_2d.position.x) * -1
			shoot_direction = -1
		if player.global_position.x > global_position.x:
			animated_sprite_2d.flip_h = true
			marker_2d.position.x = abs(marker_2d.position.x) * 1
			shoot_direction = 1
			
func _on_attack_timer_timeout() -> void:
	animated_sprite_2d.play("attack")
	enemy_shoot()
	await animated_sprite_2d.animation_finished
	animated_sprite_2d.play("default")

func enemy_shoot() -> void:
	var object = projectile_enemy.instantiate()
	object.direction = shoot_direction
	object.position = marker_2d.global_position
	get_tree().current_scene.add_child(object)
	print("shoot")
	

	
