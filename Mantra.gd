extends Node2D

var texto
var concentracion
var tiempoExp

var inputstr = ''
onready var tween = get_node("Tween")
signal completado()

func _ready():
	connect('completado', get_parent(), '_on_Mantra_completado')
	set_process_input(true)
	get_node("Texto").text = texto
	get_node("Timer").set_wait_time(tiempoExp)
	get_node("Timer").start()
	tween.interpolate_property(self, "position",
		self.position , Vector2(self.position.x, self.position.y - 100), tiempoExp,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
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
	emit_signal("completado")
	inputstr = ''
	self.queue_free()
	print("Completa Mantra")
	get_tree().get_root().get_node("Main")._si(concentracion)
	

func falla():
	self.queue_free()
	print("Falló")
	get_tree().get_root().get_node("Main")._no(concentracion)
