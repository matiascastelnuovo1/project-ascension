extends Control

var LabelMascarasColeccionadas

func _ready():
	LabelMascarasColeccionadas = $LabelMascaras
	LabelMascarasColeccionadas.text = "0"

func _process(delta):
	LabelMascarasColeccionadas.text = str(Global.mascaras_agarradas)
