extends KinematicBody2D

var UI = UserInput.new()
var Enum = Enums.new()
var Buttons = Enum.Buttons
var Direction = Enum.Direction
var ActionUtil = Enum.Action
var PlayerAnimations = Animations.new()

var direction = Direction.south
var action = ActionUtil.idle
var motion = Vector2(0,0)
export var speed = 80
onready var animationPlayer = $Animation/AnimationPlayer

func _process(_delta):
	
	if UI.buttonPressed(Buttons.defend):
		action = ActionUtil.defending
	else:
		action = ActionUtil.idle
		
	if UI.buttonPressed(Buttons.down) and not action == ActionUtil.defending:
		motion.y = speed/2
	elif UI.buttonPressed(Buttons.up) and not action == ActionUtil.defending:
		motion.y = -speed/2
	else:
		motion.y = 0
	
	if UI.buttonPressed(Buttons.left) and not action == ActionUtil.defending:
		motion.x = -speed
	elif UI.buttonPressed(Buttons.right) and not action ==ActionUtil.defending:
		motion.x = speed
	else:
		motion.x = 0
	
	if UI.buttonPressed(Buttons.down):
		if UI.buttonPressed(Buttons.left):
			direction = Direction.southWest
		elif UI.buttonPressed(Buttons.right):
			direction = Direction.southEast
		else:
			direction = Direction.south
	elif UI.buttonPressed(Buttons.up):
		if UI.buttonPressed(Buttons.left):
			direction = Direction.northWest
		elif UI.buttonPressed(Buttons.right):
			direction = Direction.northEast
		else:
			direction = Direction.north
	elif UI.buttonPressed(Buttons.left):
		direction = Direction.west
	elif UI.buttonPressed(Buttons.right):
		direction = Direction.east
	
	if action != ActionUtil.defending:
		if motion.x == 0 && motion.y == 0:
			action = ActionUtil.idle
		else:
			action = ActionUtil.running
	
	PlayerAnimations.playAnimation(direction, action, animationPlayer)
	
	move_and_slide(motion)
