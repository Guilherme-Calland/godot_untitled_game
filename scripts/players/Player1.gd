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

var hasAction : bool = false

func _process(_delta):
	
	if UI.buttonPressed(Buttons.defend):
		action = ActionUtil.defending
		hasAction = true
	elif UI.buttonPressed(Buttons.attack):
		action = ActionUtil.attacking
		hasAction = true
	else:
		hasAction = false
		
	if UI.buttonPressed(Buttons.down) and not movementBlocked():
		motion.y = speed/2
	elif UI.buttonPressed(Buttons.up) and not movementBlocked():
		motion.y = -speed/2
	else:
		motion.y = 0
	
	if UI.buttonPressed(Buttons.left) and not movementBlocked():
		motion.x = -speed
	elif UI.buttonPressed(Buttons.right) and not movementBlocked():
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
	
	if not hasAction and not PlayerAnimations.currentAnimation(direction, ActionUtil.attacking, animationPlayer):
		if motion.x == 0 && motion.y == 0:
			action = ActionUtil.idle
		else:
			action = ActionUtil.running
	
	PlayerAnimations.playAnimation(direction, action, animationPlayer)
	
	move_and_slide(motion)
	
func movementBlocked():
	return (hasAction or PlayerAnimations.currentAnimation(direction, ActionUtil.attacking, animationPlayer))
