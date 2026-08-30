extends CharacterBody2D
@onready var attack_timer: Timer = $AttackTimer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var marker_2d: Marker2D = $Marker2D
@onready var defeated_sound: AudioStreamPlayer2D = $DefeatedSound

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var projectile_enemy = preload("res://Scenes/lucky_cat_projectile.tscn")
var speed: float = 5
var distance: float = 7
var y_direction : int = 1
var shoot_direction = -1
var start_y : float
var player : Node2D
var lucky_cat_health = 5
var is_dead: bool = false

func _ready() -> void:
	start_y = global_position.y
	player = get_tree().get_first_node_in_group("Player")


func _physics_process(delta: float) -> void:
	if is_dead:
		if not is_on_floor():
			velocity.y += gravity * delta
		else:
			velocity.y = 0
		move_and_slide()
		return
	
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

	
func take_damage():
	if is_dead:
		return
	
	audio_stream_player_2d.play()
	lucky_cat_health -= 1
	
	if lucky_cat_health <= 0:
		is_dead = true
		attack_timer.stop()
		defeated_sound.play()
		animated_sprite_2d.play("death")
	
func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectile") and lucky_cat_health > 0:
		take_damage()
		
