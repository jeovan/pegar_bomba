extends AnimatedSprite

func _ready():
	self.frame = 0
	self.play()


func _on_explosao_animation_finished():
	self.queue_free() 
	
