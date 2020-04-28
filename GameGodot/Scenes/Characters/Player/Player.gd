extends "res://Scripts/generics/mecanica.gd"

var lista_animacao = ["walk", "Idle", "jump_down", "jump_up"]

# Called when the node enters the scene tree for the first time.

func Main():
	add_to_group("Player")
	ACELERACAO = 300
	VEL_MAXIMA = 600
	VEL_MINIMA = 100
	GRAVIDADE = -2000
	forca_pulo = 700
	forca_pulo_duplo = 700
	UP = Vector2(0,-1)
	
	
	
	pass


func On_Input_Event():
	
	
	direcao_entrada.x = float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left")) 
	
	##if Input.is_action_pressed("ui_right"):
	##	direcao_entrada.x = 1
	##	pass
	##elif Input.is_action_pressed("ui_left"):
	##	direcao_entrada.x = -1
	##	pass
	##else:
	##	direcao_entrada.x = 0
	##	pass
	
	direcao_entrada.y = - float(Input.is_action_pressed("ui_up"))
	
	#if Input.is_action_pressed("ui_up"):
	#	direcao_entrada.y = -1
	#else:
	#	direcao_entrada.y = 0
	#pass


func animation():
	
	var animacao = ""
	var animacao_atual = ""
	
	if chao == true and pre_chao == false:
		animacao = "floor"
	elif direcao_entrada.y == -1 and chao == true:
		animacao = "jump"
	
	if animacao != animacao_atual:
		animacao_atual = animacao
		$SFX.play(animacao_atual)
	
	if status == lista_status[0]:
		animacao = lista_animacao[1]
		pass
	elif status == lista_status[1]:
		animacao = lista_animacao[0]
		pass
	elif status == lista_status[2]:
		animacao = lista_animacao[3]
		pass
	elif status == lista_status[3]:
		animacao = lista_animacao[2]
		pass
	
	if animacao != animacao_atual:
		animacao_atual = animacao
		$Animation.play(animacao_atual)
	
	
	pass
