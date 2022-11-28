extends KinematicBody2D

var motion = Vector2(0,0)
export var speed = 80

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
	
	move_and_slide(motion)
