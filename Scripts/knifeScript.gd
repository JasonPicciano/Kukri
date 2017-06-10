extends KinematicBody2D

var position
var rotation
var ppos
var prot

var linvelocity
var rotvelocity
var hand

func _ready():
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	
	if (Globals.get("Swing")==3):
		linvelocity = get_pos() - ppos
		rotvelocity = get_rot() - prot
		if(linvelocity!=Vector2(0,0)):
			move(linvelocity)
			rotate(rotvelocity)
			
	if (is_colliding()):
		if(Globals.get("Swing")==3):
			print("Kinematic Knife Collided")
			Globals.set("Swing",4)
		

	ppos = position
	prot = rotation
	position = self.get_pos()
	rotation = self.get_rot()
	pass

