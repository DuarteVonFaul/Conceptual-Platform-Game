extends "res://Scripts/generics/mecanica.gd"

func Main():
	
	ACELERACAO = 300
	VEL_MAXIMA = 600
	VEL_MINIMA = 30
	GRAVIDADE = -1000
	UP = Vector2(0,-1)
	direcao_entrada.x = -1
	
	
	pass

func On_Input_Event():
	
	
	if !is_on_floor() and UP.y == -1 and !$RayCast2D.is_colliding():
		rotation_degrees = -90
		direcao_entrada.x = 1
		UP = Vector2(-1,0)
		
		
		
	elif !is_on_floor() and UP.x == 1 and !$RayCast2D.is_colliding():
		rotation_degrees = 0
		direcao_entrada.x = -1
		UP = Vector2(0,-1)
		
	elif !is_on_floor() and UP.y == 1 and !$RayCast2D.is_colliding() :
		rotation_degrees = 90
		direcao_entrada.x = -1
		UP = Vector2(1,0)
		
		
	elif !is_on_floor() and UP.x == -1 and !$RayCast2D.is_colliding() :
		rotation_degrees = 180
		direcao_entrada.x = 1
		UP = Vector2(0,1)
	pass


func animation():
	
	var animacao = ""
	var animacao_atual = ""
	
	if status ==  lista_status[1]:
		animacao = "walk"
	
	if animacao != animacao_atual:
		animacao_atual = animacao
		$Animation.play(animacao_atual)
	
	
	pass
