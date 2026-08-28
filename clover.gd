extends Area2D
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var enemy_speed = 20.0
var direction : int = 1
 
func _physics_process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction  = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * enemy_speed * delta


	#move_and_slide()
