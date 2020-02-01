extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 20
onready var tween = get_node("Tween")
#onready var meditador = get_parent();

# Called when the node enters the scene tree for the first time.
func _ready():
	_move(100)
	#var tween = get_node("Tween")
	pass # Replace with function body.
	
func _process(delta):
	#_elevate(delta);
	pass
	


	
func _ascend(focusvalue):
	_move(-focusvalue)
	#position+=	Vector2(0,delta*speed)
	
	
	pass
	
func _move(focusvalue):
	tween.interpolate_property(self, "position",
		self.position , Vector2(self.position.x, self.position.y + focusvalue), 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	
func _descend(focusvalue):
	_move(focusvalue)
	pass
	
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AscendButton_pressed():
	_ascend(100)
	pass # Replace with function body.


func _on_DescendButton_pressed():
	_descend(100)
	pass # Replace with function body.
