extends Node2D

@export var tutorial_text: String = "Presiona espacio para saltar..."
@export var text_speed: float = 0.05
#@export var one_shot: bool = true

@onready var label: RichTextLabel = $Area2D/CanvasLayer/TextoTutorial
#@onready var bubble: Sprite2D = $Sprite2D

var already_triggered: bool = false
var tween: Tween

func _ready() -> void:
	label.visible = false
	label.visible_characters = 0
	#bubble.visible = false
	
func show_tutorial() -> void:
	#bubble.visible = true
	label.visible = true
	label.text = tutorial_text
	label.visible_characters = 0
	
	if tween and tween.is_running():
		tween.kill()
	
	var total_duration = tutorial_text.length() * text_speed
	
	tween = create_tween()
	tween.tween_property(label, "visible_characters", tutorial_text.length(), total_duration)

func hide_tutorial() -> void:
	if tween and tween.is_running():
		tween.kill()
	
	var fade_tween = create_tween()
	fade_tween.tween_property(label, "modulate:a", 0.0, 0.3)
	#fade_tween.tween_property(bubble, "modulate:a", 0.0, 0.3)
	already_triggered = false
	fade_tween.finished.connect(func():
		label.visible = false
		#bubble.visible = false
		label.modulate.a = 1.0
		#bubble.modulate.a = 1.0
	)


func _on_tutorial_1_body_entered(body: Node2D) -> void:
	print("Entró: ", body.name)
	if not body.is_in_group("player"):
		return
	
	#if one_shot and already_triggered:
	if already_triggered:
		return
	
	already_triggered = true
	
	show_tutorial()

	
	# Alternativa por nombre
	if "player" in body.name.to_lower():
		show_tutorial()
	
	
	# O por tipo
	if body is CharacterBody2D:
		show_tutorial()


func _on_tutorial_1_body_exited(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	
	hide_tutorial()
