extends KinematicBody2D

var UI = UserInput.new()
var Enum = Enums.new()
var Buttons = Enum.Buttons
var Direction = Enum.Direction
var PhysicsStatus = Enum.PhysicsStatus
var PlayerAnimations = Animations.new()

var direction = Direction.south
var physicsStatus = PhysicsStatus.idle
var motion = Vector2(0,0)
export var speed = 80
onready var animationPlayer = $Animation/AnimationPlayer

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
	
	if motion.x == 0 && motion.y == 0:
		physicsStatus = PhysicsStatus.idle
	else:
		physicsStatus = PhysicsStatus.running
	
	PlayerAnimations.playAnimation(direction, physicsStatus, animationPlayer)
	
	move_and_slide(motion)
