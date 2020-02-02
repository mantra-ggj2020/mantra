extends Node2D

var texto = "Om shamansadhasd asdasd adssad sarsasasa sasassa"
var concentracion = 5
var tiempoExp = 8.5
var idxLetra = 0
var inputstr = ''
onready var tween = get_node("Tween")
signal completado()

func _ready():
	connect('completado', get_parent(), '_on_Mantra_completado')
	set_process_input(true)
	get_node("Texto").text = texto
	get_node("Texto4").bbcode_text = ' '+texto
	_center()
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
#		self.inputstr = str(self.inputstr) + s
##		print(inputstr)
#		if inputstr.to_lower().similarity(texto.to_lower()) > 0:
#			get_node("TextoTipeado").text = inputstr.to_lower()
#		if texto.to_lower() in inputstr.to_lower():
#			completa()
		if texto[idxLetra].to_upper() == s.to_upper():
			get_node("Texto4").bbcode_text = ' [color=#00EE00][tornado radius=5 freq=5]'+texto.substr(0,idxLetra+1)+'[/tornado][/color]'+texto.substr(idxLetra+1)
			_center()
			idxLetra = idxLetra + 1
			if idxLetra == texto.length():
				completa()
		elif (s.to_upper() >= 'A' and s.to_upper() <= 'Z') or s == ' ':
			get_node("Texto4").bbcode_text = ' [color=red]'+texto.substr(0,idxLetra)+'[/color]'+texto.substr(idxLetra)
			_center()

func _on_Timer_timeout():
	falla()
	
func completa():
	emit_signal("completado")
#	inputstr = ''
	self.queue_free()
#	print("Completa Mantra")
	get_tree().get_root().get_node("Main")._si(concentracion)
	
	
func falla():
	self.queue_free()
#	print("Falló")
	get_tree().get_root().get_node("Main")._no(concentracion)
	
func _center():
	get_node("Texto4").bbcode_text = '[center]' + get_node("Texto4").bbcode_text + '[/center]'
