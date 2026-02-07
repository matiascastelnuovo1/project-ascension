extends Node2D

var total_time_in_secs = 0

func _ready():
	$Timer.start()
	$Label.text = '%02d:%02d' % [0, 0]



func _on_timer_timeout() -> void:
	total_time_in_secs += 1
	var m = int(total_time_in_secs / 60.0)
	var s = total_time_in_secs - m * 60
	$Label.text = '%02d:%02d' % [m, s]
	pass # Replace with function body.
