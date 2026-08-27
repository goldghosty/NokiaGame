extends StaticBody2D
@onready var ray_cast_2d_left: RayCast2D = $RayCast2DLeft
@onready var ray_cast_2d_right: RayCast2D = $RayCast2DRight
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var is_swipeable = true

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_2d_left.is_colliding() and Input.is_action_just_pressed("swipe") and is_swipeable or ray_cast_2d_right.is_colliding() and Input.is_action_just_pressed("swipe") and is_swipeable:
		animated_sprite_2d.play("spilled")
		is_swipeable = false
		
			
