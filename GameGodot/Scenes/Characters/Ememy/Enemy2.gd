extends "res://Scripts/generics/mecanica.gd"

func Main():
	
	acceleration = 300
	velocityMax = 600
	velocityMin = 30
	GRAVITY = -1000
	UP = Vector2(0,-1)
	entryDir.x = -1
	
	
	pass

func On_Input_Event():
	
	
	if !is_on_floor() and UP.y == -1 and !$RayCast2D.is_colliding():
		rotation_degrees = -90
		entryDir.x = 1
		UP = Vector2(-1,0)
		
		
		
	elif !is_on_floor() and UP.x == 1 and !$RayCast2D.is_colliding():
		rotation_degrees = 0
		entryDir.x = -1
		UP = Vector2(0,-1)
		
	elif !is_on_floor() and UP.y == 1 and !$RayCast2D.is_colliding() :
		rotation_degrees = 90
		entryDir.x = -1
		UP = Vector2(1,0)
		
		
	elif !is_on_floor() and UP.x == -1 and !$RayCast2D.is_colliding() :
		rotation_degrees = 180
		entryDir.x = 1
		UP = Vector2(0,1)
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
