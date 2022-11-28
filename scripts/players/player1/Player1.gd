extends KinematicBody2D

var motion = Vector2(0,0)
export var speed = 80
onready var animationPlayer = $Animation/AnimationPlayer

var UI = UserInput.new()
var Buttons = Enums.new().Buttons

func _process(delta):
	if UI.buttonPressed(Buttons.down):
		motion.y = speed/2
	elif UI.buttonPressed(Buttons.up):
		motion.y = -speed/2
	else:
		motion.y = 0
	
	if UI.buttonPressed(Buttons.left):
		motion.x = -speed
	elif UI.buttonPressed(Buttons.right):
		motion.x = speed
	else:
		motion.x = 0
	
	if UI.buttonPressed(Buttons.down):
		if UI.buttonPressed(Buttons.left):
			animationPlayer.play("running_south_west")
		elif UI.buttonPressed(Buttons.right):
			animationPlayer.play("running_south_east")
		else:
			animationPlayer.play("running_south")
	elif UI.buttonPressed(Buttons.up):
		if UI.buttonPressed(Buttons.left):
			animationPlayer.play("running_north_west")
		elif UI.buttonPressed(Buttons.right):
			animationPlayer.play("running_north_east")
		else:
			animationPlayer.play("running_north")
	elif UI.buttonPressed(Buttons.left):
		animationPlayer.play("running_west")
	elif UI.buttonPressed(Buttons.right):
		animationPlayer.play("running_east")
	
	
	move_and_slide(motion)
