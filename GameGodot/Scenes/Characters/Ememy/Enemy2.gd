extends "res://Scripts/generics/mecanica.gd"

func Main():
	
	velocityMax = 600
	velocityMin = 30
	GRAVITY = -1000
	UP = Vector2(0,-1)
	entryDir.x = -1
	
	
	pass

func On_Input_Event():
	
	#Orientação passada
	if !is_on_floor() and UP.y == -1:
		$SpriteControl.play("02")
		$sprite.set_flip_v(false)
		$sprite.set_flip_h(false)
		entryDir.x = 1
		UP = Vector2(-1,0)#Orientação Futura
		
		
		
	elif !is_on_floor() and UP.x == 1:
		$SpriteControl.play("01")
		$sprite.set_flip_v(false)
		$sprite.set_flip_h(false)
		entryDir.x = -1
		UP = Vector2(0,-1)
		
	elif !is_on_floor() and UP.y == 1:
		$SpriteControl.play("02")
		$sprite.set_flip_v(true)
		$sprite.set_flip_h(true)
		entryDir.x = -1
		UP = Vector2(1,0)
		
		
	elif !is_on_floor() and UP.x == -1:
		$SpriteControl.play("01")
		$sprite.set_flip_v(true)
		$sprite.set_flip_h(true)
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
