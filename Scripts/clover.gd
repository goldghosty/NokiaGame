extends Area2D
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var enemy_killed: AudioStreamPlayer2D = $EnemyKilled
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


var enemy_speed = 20.0
var direction : int = 1
var clover_on_screen = false
 

func _ready() -> void:
	visible_on_screen_notifier_2d.screen_entered.connect(clover_screen_entered)
	visible_on_screen_notifier_2d.screen_exited.connect(clover_screen_exited)

	
func _physics_process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction  = -1
		print("collided")
		animated_sprite_2d.flip_h = true
	elif ray_cast_left.is_colliding():
		direction = 1
		print("collided left")
		animated_sprite_2d.flip_h = false
	position.x += direction * enemy_speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectile") and clover_on_screen:
		collision_shape_2d.set_deferred("disabled", true)
		direction = 0
		enemy_killed.play()
		animated_sprite_2d.play("death")
		await animated_sprite_2d.animation_finished
		
		#await enemy_killed.finished
		queue_free()


func clover_screen_entered():
	clover_on_screen = true
	
func clover_screen_exited():
	clover_on_screen = false
