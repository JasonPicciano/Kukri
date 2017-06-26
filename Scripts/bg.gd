extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var animator
var hand
var knife
var newKnife

func _ready():
	print("main script is called")
	newKnife = load("res://Scripts/knife.tscn")

	self.set_process(true)
	animator = get_node("AnimationPlayer")
	Globals.set("Swing",0)
	# Initialization here
	pass

func _process(delta):

	if(Input.is_mouse_button_pressed(1)):
		if(Globals.get("Swing")==0):
			knife = get_node("knife")
			animator.play("upperArmSwing")
			Globals.set("Swing",1)

		if(Globals.get("Swing")==2):
			Globals.set("Swing",3)
			var animSwing = animator.get_animation("upperArmSwing")
			knife.set_gravity_scale(1)
			animSwing.remove_track(7)
			animSwing.remove_track(7)
			print("Knife Throw")

	if(Globals.get("Swing")==6):
		knife.queue_free()
		var node = newKnife.instance()
		add_child(node)
		print(get_node("knife").get_name())
		animator.queue("upperArmSwing")
		get_node("AnimationPlayer").get_animation("upperArmSwing").track_set_path(7, "knife:transofrm/pos")
		get_node("AnimationPlayer").get_animation("upperArmSwing").track_set_path(8, "knife:transofrm/rot")
		get_node("AnimationPlayer").get_animation("upperArmSwing").track_set_path(9, "knife:transofrm/scale")
		Globals.set("Swing",0)




func ReadyRelease():
	if(Globals.get("Swing")==1):
		Globals.set("Swing",2)
		print("ReadyRelease was called")
