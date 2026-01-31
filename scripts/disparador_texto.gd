extends Node2D

@export var tutorial_text: String = "Presiona espacio para saltar..."
@export var duration: float = 0.8
var currentLabel: RichTextLabel

@onready var label1: RichTextLabel = $TextoTutorial1
@onready var label2: RichTextLabel = $TextoTutorial2
@onready var label3: RichTextLabel = $TextoTutorial3
@onready var label4: RichTextLabel = $TextoTutorial4
@onready var label5: RichTextLabel = $TextoTutorial5
@onready var label6: RichTextLabel = $TextoTutorial6

var already_triggered: bool = false
var tween: Tween

func _ready() -> void:
	
	if label1 != null:
		currentLabel = label1
		label1.visible = false
		label1.visible_characters = 0
	
	if label2 != null:
		currentLabel = label2
		label2.visible = false
		label2.visible_characters = 0
	
	if label3 != null:
		currentLabel = label3
		label3.visible = false
		label3.visible_characters = 0
	
	if label4 != null:
		currentLabel = label4
		label4.visible = false
		label4.visible_characters = 0
	
	if label5 != null:
		currentLabel = label5
		label5.visible = false
		label5.visible_characters = 0
	
	if label6 != null:
		currentLabel = label6
		label6.visible = false
		label6.visible_characters = 0
	
func show_tutorial() -> void:
	#bubble.visible = true
	currentLabel.visible = true
	currentLabel.text = tutorial_text
	currentLabel.visible_characters = 0
	
	if tween and tween.is_running():
		tween.kill()
	
	#var total_duration = tutorial_text.length() * text_speed
	
	tween = create_tween()
	tween.tween_property(currentLabel, "visible_characters", tutorial_text.length(), duration)

func hide_tutorial() -> void:
	if tween and tween.is_running():
		tween.kill()
	
	var fade_tween = create_tween()
	fade_tween.tween_property(currentLabel, "modulate:a", 0.0, 0.3)
	#fade_tween.tween_property(bubble, "modulate:a", 0.0, 0.3)
	already_triggered = false
	fade_tween.finished.connect(func():
		currentLabel.visible = false
		#bubble.visible = false
		currentLabel.modulate.a = 1.0
		#bubble.modulate.a = 1.0
	)

func _handle_label_execution_hide(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	
	hide_tutorial()
	
func _handle_label_execution(body: Node2D) -> void:
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
		
		
#-----------------------------------SIGNALS-----------------------------------

func _on_area_tutorial_1_body_entered(body: Node2D) -> void:
	_handle_label_execution(body)

func _on_area_tutorial_1_body_exited(body: Node2D) -> void:
	_handle_label_execution_hide(body)

func _on_area_tutorial_2_body_entered(body: Node2D) -> void:
	_handle_label_execution(body)

func _on_area_tutorial_2_body_exited(body: Node2D) -> void:
	_handle_label_execution_hide(body)

func _on_area_tutorial_3_body_entered(body: Node2D) -> void:
	_handle_label_execution(body)

func _on_area_tutorial_3_body_exited(body: Node2D) -> void:
	_handle_label_execution_hide(body)

func _on_area_tutorial_4_body_entered(body: Node2D) -> void:
	_handle_label_execution(body)

func _on_area_tutorial_4_body_exited(body: Node2D) -> void:
	_handle_label_execution_hide(body)

func _on_area_tutorial_5_body_entered(body: Node2D) -> void:
	_handle_label_execution(body)

func _on_area_tutorial_5_body_exited(body: Node2D) -> void:
	_handle_label_execution_hide(body)

func _on_area_tutorial_6_body_entered(body: Node2D) -> void:
	_handle_label_execution(body)

func _on_area_tutorial_6_body_exited(body: Node2D) -> void:
	_handle_label_execution_hide(body)
