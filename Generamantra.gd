extends Node2D

var Mantra = preload("res://Mantra.tscn")
var mantras = {}

var mantraActual
var nivel = 1 #Nivel actual. Hay que ver si se toma de otro lado. Para probar está puesto siempre el 1
var file = File.new()
onready var timer = get_node("Timer")
onready var screen_size = get_viewport_rect().size


func _ready():
	file.open("res://resources/mantras.json", file.READ)
	mantras = parse_json(file.get_as_text())
	file.close()
	generar(mantras[str(nivel)][randi()%mantras[str(nivel)].size()])

func generar(mantra):
	randomize()
	mantraActual = Mantra.instance();
	mantraActual.texto = mantra.texto
	mantraActual.concentracion = mantra.concentracion
	mantraActual.tiempoExp = mantra.tiempoExp
	mantraActual.position = Vector2(rand_range(300,screen_size.x-300), rand_range(300,screen_size.y-300))
#	get_tree().get_root().call_deferred("add_child", mantraActual)
	call_deferred("add_child", mantraActual)
	timer.set_wait_time(mantra.tiempoExp)
	timer.start()

func _on_Timer_timeout():
	#idMantra = idMantra + 1
	generar(mantras[str(nivel)][randi()%mantras[str(nivel)].size()])
