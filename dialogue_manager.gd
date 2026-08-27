extends CanvasLayer

@onready var dialogue_box: Control = $DialogueBox
@onready var dialogue_text: Label = $DialogueBox/TextureRect/DialogueText

var dialogue_lines: Array[String] = []
var current_line_index: int = 0
var is_dialogue_active: bool = false
var dialogue_speed = 0.05

func _ready() -> void:
	dialogue_box.visible = false
	
func start_dialogue(lines: Array[String]):
	get_tree().paused = true
	
	dialogue_lines = lines
	current_line_index = 0
	is_dialogue_active = true
	dialogue_box.visible = true
	show_line()
	
func _input(event):
	if not is_dialogue_active:
		return
	if event.is_action_pressed("advance_dialogue"):
		advance_dialogue()
		
func advance_dialogue():
	if current_line_index < dialogue_lines.size() - 1:
		current_line_index += 1
		show_line()
		
	else:
		get_tree().paused = false
		
		is_dialogue_active = false
		dialogue_box.visible = false
		
func show_line():
	dialogue_text.text = dialogue_lines[current_line_index]
	dialogue_text.visible_ratio = 0.0
	var duration = dialogue_text.text.length()* dialogue_speed
	
	var tween = create_tween()
	tween.tween_property(dialogue_text, "visible_ratio", 1.0, duration)
