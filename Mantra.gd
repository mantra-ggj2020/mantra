extends Node2D

var texto
var concentracion
var tiempoExp

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Texto").text = texto
	get_node("Timer").set_wait_time(tiempoExp)
	get_node("Timer").start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	self.queue_free()
