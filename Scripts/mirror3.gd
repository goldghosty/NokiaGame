extends Area2D
@export var next_scene : PackedScene
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var mirror_break: AudioStreamPlayer2D = $MirrorBreak

var is_on_screen : bool = false
var mirror_broken: bool = false
var ready_to_change : bool = false

func _ready() -> void:
	visible_on_screen_notifier_2d.screen_entered.connect(on_screen_entered)
	visible_on_screen_notifier_2d.screen_exited.connect(on_screen_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectile") and !mirror_broken and is_on_screen and Global.level_three_complete:
		animated_sprite_2d.play("breaking")
		mirror_break.play()
		mirror_broken = true

	

func on_screen_entered():
	is_on_screen = true

func on_screen_exited():
	is_on_screen = false


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and Global.level_three_complete and mirror_broken == true:
		ready_to_change = true
