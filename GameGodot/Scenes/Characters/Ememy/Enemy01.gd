extends "res://Scripts/generics/mecanica.gd"

func Main():
	
	acceleration = 300
	velocityMax = 600
	velocityMin = 30
	GRAVITY = -2000
	UP = Vector2(0,-1)
	entryDir.x = -1

	pass

func On_Input_Event():
	
	if is_on_wall():
		entryDir.x = -entryDir.x
	
	pass


func animation():
	
	var anim = ""
	var currentAnim = ""
	
	if getStatus() ==  statusList[1]:
		anim = "walk"
	
	if anim != currentAnim:
		currentAnim = anim
		$Animation.play(currentAnim)
	
	
	pass
