extends Node2D
@onready var sonido_condor_emitter: FmodEventEmitter2D = $FmodSonidoCondorEmitter2D

@export var punto_b: Vector2
@export var distancia_diagonal: float = 1200.0
@export var angulo_diagonal: float = -45.0
@export var velocidad: float = 400.0
@export var debug_visual: bool = true

var punto_a: Vector2
var punto_c: Vector2
var progreso: float = 0.0

func _ready():
	calcular_recorrido_exacto()
	position = punto_a

	if debug_visual:
		queue_redraw()

func calcular_recorrido_exacto():
	var angulo_rad = deg_to_rad(angulo_diagonal)
	var direccion_unitaria = Vector2(cos(angulo_rad), sin(angulo_rad))

	# Calcular puntos extremos
	punto_a = punto_b - direccion_unitaria * distancia_diagonal
	punto_c = punto_b + direccion_unitaria * distancia_diagonal

	# Verificación matemática
	var distancia_ab = punto_a.distance_to(punto_b)
	var distancia_bc = punto_b.distance_to(punto_c)
	var distancia_ac = punto_a.distance_to(punto_c)

	print("=== VERIFICACIÓN ===")
	print("Distancia A-B: ", distancia_ab)
	print("Distancia B-C: ", distancia_bc)
	print("Distancia A-C: ", distancia_ac)
	print("¿Son iguales A-B y B-C?: ", abs(distancia_ab - distancia_bc) < 0.001)
	print("¿A-C es el doble?: ", abs(distancia_ac - (distancia_ab + distancia_bc)) < 0.001)

func _process(delta):
	var distancia_total = punto_a.distance_to(punto_c)
	var velocidad_normalizada = velocidad / distancia_total
	progreso += velocidad_normalizada * delta

	if progreso >= 1.0:
		progreso = 0.0

	# MÉTODO CORREGIDO: Usar interpolación exacta
	position = interpolacion_exacta(progreso)

func interpolacion_exacta(t: float) -> Vector2:	
	if abs(t - 0.5) < 0.001:  # Si está muy cerca del 50%
		return punto_b

	# Para el resto, usar interpolación normal
	return punto_a + (punto_c - punto_a) * t

func _draw():
	if not debug_visual:
		return

	# Dibujar la línea del recorrido
	draw_line(punto_a, punto_c, Color.RED, 2.0)

	# Dibujar los puntos
	draw_circle(punto_a, 8, Color.GREEN)  # Punto A
	draw_circle(punto_b, 8, Color.BLUE)   # Punto B
	draw_circle(punto_c, 8, Color.GREEN)  # Punto C

# Dibujar posición actual
	draw_circle(Vector2.ZERO, 5, Color.YELLOW)  # Posición del pájaro	
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		body.push(global_position)
		sonido_condor_emitter.play()
