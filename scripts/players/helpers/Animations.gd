class_name Animations

var EnumUtil : Enums = Enums.new()
var Direction = EnumUtil.Direction
var ActionUtil = EnumUtil.Action

func playAnimation(direction, action, animationPlayer):
	var animPart1: String = ''
	var animPart2: String = ''
	if action == ActionUtil.idle:
		animPart1 = 'idle_'
	elif action == ActionUtil.running:
		animPart1 = 'running_'
	elif action == ActionUtil.defending:
		animPart1 = 'defending_'
	
	if direction == Direction.south:
		animPart2 = 'south'
	elif direction == Direction.southEast:
		animPart2 = 'south_east'
	elif direction == Direction.east:
		animPart2 = 'east'
	elif direction == Direction.northEast:
		animPart2 = 'north_east'
	elif direction == Direction.north:
		animPart2 = 'north'
	elif direction == Direction.northWest:
		animPart2 = 'north_west'
	elif direction == Direction.west:
		animPart2 = 'west'
	elif direction == Direction.southWest:
		animPart2 = 'south_west'
	
	var animationLabel : String = animPart1 + animPart2
	animationPlayer.play(animationLabel)
