extends RigidBody2D

var position
var rotation
var ppos
var prot

var linvelocity
var rotvelocity
var hand
var screen

func _ready():
	set_fixed_process(true)
	screen = get_viewport_rect().size
	pass
	
func _fixed_process(delta):
	
	if (Globals.get("Swing")==3):
		
		linvelocity = get_pos() - ppos
		rotvelocity = get_rot() - prot
		if(linvelocity!=Vector2(0,0)):
			set_pos(get_pos()+ linvelocity)
			set_rot(get_rot()+ rotvelocity)
			
		if(self.get_pos().y < 0 or self.get_pos().x <0 or self.get_pos().y >screen.y or self.get_pos().x>screen.x):
			Globals.set("Swing",6)
		
#	var bodies = get_colliding_bodies()
#	if (bodies.size()>0):
#		print(bodies)
#		print("Knife collisions")


	ppos = position
	prot = rotation
	position = self.get_pos()
	rotation = self.get_rot()
	pass



func _on_wall_body_enter( body ):
#	Globals.set("Swing",4)
	if (body.get_name()==" knife"):
		print ("Body enter:Knife")
		
	if (body.get_name()=="hilt"):
		
		print ("Body enter: hilt")
