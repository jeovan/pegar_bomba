extends KinematicBody2D
export var speed = 300
onready var spr_player = $sprite

var look_at = 1


func _ready():
	pass

	
func _process(delta):
	
	var direcao = Vector2()
	direcao.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	change_dir(direcao.x)
		
	if self.position.x <= 62:
		self.position.x = 62
	if self.position.x >= 450:
		self.position.x = 450
		
	move_and_slide(direcao * speed)
	
	
func change_dir(dir):
	if look_at != dir and dir != 0:
		self.scale.x *= -1
		look_at = dir
