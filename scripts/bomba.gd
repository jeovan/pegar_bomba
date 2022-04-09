extends Area2D

export var vel = 100
var pre_smoke = preload("res://scenes/smoke.tscn")
var t_smoke = 0


var pre_fumaca = preload("res://scenes/fumaca.tscn")

var pre_explosao = preload("res://scenes/explosao.tscn")

func _ready():
	pass


func _process(delta):
	t_smoke += delta
	if t_smoke > rand_range(0.1,0.2):
		Smoke()
		t_smoke = 0
	vel +=3
	self.position.y += vel * delta
	if self.position.y > 700:
		self.queue_free()

func _on_bomba_body_entered(body):
	if body.name == 'player':
		get_parent().pontos += 10
		emitir_fumaca()
		self.queue_free()


func _on_bomba_area_entered(area):
	if area.name == 'chao':
		get_parent().pontos -= 20
		emitir_explosao()
		self.queue_free()
		
func Smoke():
	var s = pre_smoke.instance()
	s.position = self.position + Vector2(rand_range(-30,-15),-15)
	get_parent().add_child(s)
	
func emitir_fumaca():
	var f = pre_fumaca.instance()
	f.position = self.position
	get_parent().add_child(f)
	
	
func emitir_explosao():
	var e = pre_explosao.instance()
	e.position = self.position
	get_parent().add_child(e)
