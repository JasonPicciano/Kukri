extends RigidBody2D

func _ready():
	set_fixed_process(true)
	set_contact_monitor(true)
	pass

func _fixed_process(delta):
	var bodies = get_colliding_bodies()
#	if (bodies.size()>0):
#		print(bodies[0].get_name())
#		print("Wall collisions")
		