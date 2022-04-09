extends Node2D

var pre_bomba = preload("res://scenes/bomba.tscn")
var tempo = 0
export var intervalo = 2

# sistema de pontos do jogo

export var pontos = 0
onready var txt_label = $label

func _ready():
	pass


func _process(delta):
	txt_label.text = "Pontos " +str(pontos)
	tempo += delta
	if tempo > intervalo:
		criar_bomba()
		tempo = 0
		
func criar_bomba():
	var bomba = pre_bomba.instance()
	bomba.position = Vector2(rand_range(30,500),0)
	self.add_child(bomba)