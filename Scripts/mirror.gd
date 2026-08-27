extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

var is_on_screen : bool = false
var mirror_broken: bool = false

func _ready() -> void:
	visible_on_screen_notifier_2d.screen_entered.connect(on_screen_entered)
	visible_on_screen_notifier_2d.screen_exited.connect(on_screen_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectile") and !mirror_broken and is_on_screen:
		print ("entered")
		animated_sprite_2d.play("breaking")
		mirror_broken = true
		
func on_screen_entered():
	is_on_screen = true

func on_screen_exited():
	is_on_screen = false
