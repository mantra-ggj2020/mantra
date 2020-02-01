extends CanvasLayer

var Mantra = preload("res://Mantra.tscn")
var mantras = {}

var mantraActual
var nivel = 7 #Nivel actual. Hay que ver si se toma de otro lado. Para probar está puesto siempre el 1
var file = File.new()
var rng = RandomNumberGenerator.new()
onready var timer = get_node("Timer")
onready var screen_size = get_viewport().size


func _ready():
	file.open("res://resources/mantras.json", file.READ)
	mantras = parse_json(file.get_as_text())
	file.close()
	generar(mantras[str(rng.randi_range(1,nivel))][randi()%mantras[str(nivel)].size()])

func generar(mantra):
	rng.randomize()
	mantraActual = Mantra.instance();
	mantraActual.texto = mantra.texto
	mantraActual.concentracion = mantra.concentracion
	mantraActual.tiempoExp = mantra.tiempoExp
	mantraActual.position = Vector2(rand_range(screen_size.x/2-200,screen_size.x/2+200), rand_range(screen_size.y/2-200,screen_size.y/2+200))
#	get_tree().get_root().call_deferred("add_child", mantraActual)
	call_deferred("add_child", mantraActual)
	timer.set_wait_time(mantra.tiempoExp)
	timer.start()

func _on_Timer_timeout():
	#idMantra = idMantra + 1
	generar(mantras[str(rng.randi_range(1,nivel))][randi()%mantras[str(nivel)].size()])
