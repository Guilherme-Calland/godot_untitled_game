class_name UserInput

var Buttons = Enums.new().Buttons 

func buttonPressed(button):
	if button == Buttons.down:
		return Input.is_action_pressed("down") and not Input.is_action_pressed("up")
	elif button == Buttons.up:
		return Input.is_action_pressed("up") and not Input.is_action_pressed("down")
	elif button == Buttons.left:
		return Input.is_action_pressed("left") and not Input.is_action_pressed("right")
	elif button == Buttons.right:
		return Input.is_action_pressed("right") and not Input.is_action_pressed("left")
	
