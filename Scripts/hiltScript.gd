extends KinematicBody2D


func _ready():
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	if(is_colliding()):
		print("Hilt collided!!!!")
		print("Hilt collided!!!!")
		print("Hilt collided!!!!")
	