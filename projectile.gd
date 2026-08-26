extends Area2D

var speed = 100
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	position.x += speed * direction * delta
