extends Node2D

var Mantra = preload("res://Mantra.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mantras = [
{"texto": 'Om', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Om mani padme hum', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Om Namah Shivaya', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Shanti', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Har Har Har', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Lokah Samastah Sukhino Bhavantu', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Om gam ganapataye namaha', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Namo Amitoufo', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Namo Amitabha Buda', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Namo Tassa Bhagavato Arahato Samma Sambuddhassa', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Om Muni Muni Mahāmuni Sākyamuni Svāhā', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Om Sri Ganeshaya Namaha Om Ganesha Om', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Sat Patim Dehi Parameshwara', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Om Gum Ganapatayei Namaha', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Om Hanumate Nama', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Gate Gate Paragate Parasamgate Bodhi Soha Prajna Paramita', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Ong Namo Guru Dev Namo ', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Ad Gure Name', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Llugad Gure Name', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Sat Gure Name', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Siri Guru De-Ve Name', "concentracion": 5, "tiempoExp": 7 },
{"texto": 'Ap Sahae Hoa Sache Da Sacha Doa', "concentracion": 5, "tiempoExp": 7 }
]

var mantraActual
var idMantra = 0
onready var timer = get_node("Timer")
onready var screen_size = get_viewport_rect().size


# Called when the node enters the scene tree for the first time.
func _ready():
	generar(mantras[idMantra])

func generar(mantra):
	randomize()
	mantraActual = Mantra.instance();
	mantraActual.texto = mantra.texto
	mantraActual.concentracion = mantra.concentracion
	mantraActual.tiempoExp = mantra.tiempoExp
	mantraActual.position = Vector2(rand_range(100,screen_size.x-100), rand_range(100,screen_size.y-100))
	get_tree().get_root().call_deferred("add_child", mantraActual)
	timer.set_wait_time(mantra.tiempoExp)
	timer.start()
	#get_parent().add_child()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	idMantra = idMantra + 1
	generar(mantras[idMantra])
