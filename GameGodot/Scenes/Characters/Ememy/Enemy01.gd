extends "res://Scripts/generics/mecanica.gd"

func Main():
	
	ACELERACAO = 300
	VEL_MAXIMA = 600
	VEL_MINIMA = 30
	GRAVIDADE = -2000
	UP = Vector2(0,-1)
	direcao_entrada.x = -1
	
	pass

func On_Input_Event():
	
	if is_on_wall():
		direcao_entrada.x = -direcao_entrada.x
	
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
