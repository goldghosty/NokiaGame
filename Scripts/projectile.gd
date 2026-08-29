extends Area2D

var speed = 100
var direction = 1


func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	position.x += speed * direction * delta


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		queue_free()
	if area.is_in_group("Mirror"):
		queue_free()
