extends "res://Scripts/generics/mecanica.gd"

var animList = ["walk", "Idle", "jump_down", "jump_up"]

# Called when the node enters the scene tree for the first time.

func Main():
	add_to_group("Player")
	acceleration = 300
	velocityMax = 600
	velocityMin = 100
	GRAVITY = -2000
	jumpingForce = 700
	secondJumpingForce = 700
	UP = Vector2(0,-1)
	
	
	
	pass


func On_Input_Event():
	
	
	entryDir.x = float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left")) 
	
	##if Input.is_action_pressed("ui_right"):
	##	direcao_entrada.x = 1
	##	pass
	##elif Input.is_action_pressed("ui_left"):
	##	direcao_entrada.x = -1
	##	pass
	##else:
	##	direcao_entrada.x = 0
	##	pass
	
	entryDir.y = - float(Input.is_action_pressed("ui_up"))
	
	#if Input.is_action_pressed("ui_up"):
	#	direcao_entrada.y = -1
	#else:
	#	direcao_entrada.y = 0
	#pass


func animation():
	
	var anim = ""
	var currentAnim = ""
	
	if Floor == true and beFloor == false:
		anim = "floor"
	elif entryDir.y == -1 and Floor == true:
		anim = "jump"
	
	if anim != currentAnim:
		currentAnim = anim
		$SFX.play(currentAnim)
	
	if getStatus() == statusList[0]:
		anim = animList[1]
		pass
	elif getStatus() == statusList[1]:
		anim = animList[0]
		pass
	elif getStatus() == statusList[2]:
		anim = animList[3]
		pass
	elif getStatus() == statusList[3]:
		anim = animList[2]
		pass
	
	if anim != currentAnim:
		currentAnim = anim
		$Animation.play(currentAnim)
	
	
	pass
