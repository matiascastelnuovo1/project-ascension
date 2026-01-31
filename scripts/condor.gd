extends Area2D

@export var speed: float = 100.0
@export var left_limit: float = 0.0
@export var right_limit: float = 1152.0
var sprite
var direction = Vector2.RIGHT

func _ready():
	print("Mis grupos: ", get_groups())
	sprite = $Sprite2D
	if direction == Vector2.RIGHT:
		sprite.flip_h = true
	if direction == Vector2.LEFT:
		sprite.flip_h = false

func _process(delta):
	position += speed * direction * delta

	if global_position.x <= left_limit:
		direction = Vector2.RIGHT
		sprite.flip_h = true
	elif global_position.x >= right_limit:
		direction = Vector2.LEFT
		sprite.flip_h = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.push(global_position)
