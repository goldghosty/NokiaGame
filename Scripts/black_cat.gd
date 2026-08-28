extends CharacterBody2D

var projectile = preload("res://Scenes/projectile.tscn")
var facing_direction = 1
const SPEED = 20.0
const JUMP_VELOCITY = -200.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hairball_timer: Timer = $HairballTimer

func _process(delta: float) -> void:
			
	if Input.is_action_just_pressed("break") and Global.can_shoot:
		shoot()

func _physics_process(delta: float) -> void:
	if not is_on_floor(): 
		velocity += get_gravity() * delta 

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_pressed("swipe") and velocity.x == 0.0:
		animated_sprite_2d.play("swipe")	
	elif is_on_floor() and velocity.x != 0.0:
		animated_sprite_2d.play("default")
	else:
		animated_sprite_2d.play("idle")
	
	if is_on_floor() and Input.is_action_pressed("drop_down"):
		position.y += 1 
		
	if direction > 0:
		animated_sprite_2d.flip_h = false
		facing_direction = 1
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		facing_direction = -1

	move_and_slide()


func shoot() -> void:	
	Global.can_shoot = false
	hairball_timer.start()
	var object = projectile.instantiate()
	object.direction = facing_direction
	object.position = global_position
	get_tree().current_scene.add_child(object)
	

func _on_hairball_timer_timeout() -> void:
	Global.can_shoot = true
