extends Sprite

func _ready():
	pass



func _on_anim_animation_finished(anim_name):
	self.queue_free()
