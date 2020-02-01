extends Node2D

var texto
var concentracion
var tiempoExp

var inputstr = ''
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	get_node("Texto").text = texto
	get_node("Timer").set_wait_time(tiempoExp)
	get_node("Timer").start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event is InputEventKey and event.pressed:
		var s = OS.get_scancode_string( event.scancode )
		if s == 'Space':
			s = ' '
		self.inputstr = str(self.inputstr) + s
		print(inputstr)
		if texto.to_upper() in inputstr.to_upper():
			completa()

func _on_Timer_timeout():
	falla()

func completa():
	inputstr = ''
	self.queue_free()
	print("Completa Mantra")

func falla():
	self.queue_free()
	print("Falló")
