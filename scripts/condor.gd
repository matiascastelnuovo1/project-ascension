extends Area2D

@export var speed: float = 100.0
@export var left_limit: float = -151.0
@export var right_limit: float = 920.0
var sprite
var direction = Vector2.RIGHT
@onready var sonido_condor_emitter: FmodEventEmitter2D = $FmodSonidoCondorEmitter2D

func _ready():
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
		sonido_condor_emitter.play()
