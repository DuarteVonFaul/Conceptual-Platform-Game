extends KinematicBody2D
#Variaveis de controle de mecanica/Fisica
var ACELERACAO = 0
var VEL_MAXIMA = 0
var VEL_MINIMA = 0
var GRAVIDADE = 0
var UP = Vector2()
var forca_pulo = 0
var forca_pulo_duplo = 0

#Variaveis de controle/permissao de funcionabilidade
export var direcao_visao_direita = false; 
export var pulo_duplo = false

#Variaveis de controle de Direção e movimento
var vel = 0
var direcao_entrada = Vector2()
var direcao_atual = Vector2()
var move = Vector2()
var gravidade = 0

#Variaveis de Status do personagem
var lista_status = ["Parado", "Andando", "Pulando", "Caindo"]

var permissao_segundo_pulo = true
var chao = true
var pre_chao = false
var status = ""

#Metodo Principal, que sera o primeiro a ser chamado no codigo
func _ready():
	
	set_process_input(true)
	set_physics_process(true)
	Main()
	pass

#Metodo de controle do Status do Personagem
func status():
	
	if chao and direcao_entrada.x != 0:
		status = lista_status[1]
		
	elif chao and direcao_entrada.x == 0 and vel == 0:
		status = lista_status[0]
		
	elif !chao and gravidade > 0:
		status = lista_status[2]
		
	elif !chao and gravidade < 0:
		status = lista_status[3]

#Metodo de controle de movimentação Horizontal
func move_x():
	
	if direcao_entrada.x == 1:
		$body.set_flip_h(direcao_visao_direita)
		pass
	elif direcao_entrada.x == -1:
		$body.set_flip_h(!direcao_visao_direita)
		pass
	
	direcao_atual.x = direcao_entrada.x
	
	pass


#Metodo de controle de movimentação vertical
func move_y():
	
	if direcao_entrada.y == -1 and chao:
		jump(forca_pulo)
	elif pulo_duplo == true:
		if permissao_segundo_pulo == true and direcao_entrada.y == -1:
			jump(forca_pulo_duplo)
			permissao_segundo_pulo = false
	pass

#Metodo de pulo
func jump(valor):
	gravidade = valor
	pass

#Metodo de processo circular/60fps
func _physics_process(delta):
	
	On_Input_Event()
	move_x()
	move_y()
	status()
	chao = is_on_floor()
	animation()
	
	
	
	
	if chao == true and pre_chao == true and direcao_entrada.y == 0:
		permissao_segundo_pulo = true
		gravidade = -30
	elif is_on_ceiling():
		gravidade = 0
		gravidade += GRAVIDADE * delta
	else:
		gravidade += GRAVIDADE * delta
	
	if UP.y != 0:
		move = Vector2(VEL_MINIMA * direcao_entrada.x, UP.y * gravidade)
		pass
	elif UP.x != 0:
		move = Vector2(UP.x * gravidade,VEL_MINIMA * direcao_entrada.x)
		pass
	
	
	

	
	move_and_slide(move, UP)
	
	
	
	
	pre_chao = chao
	



#Metodos de Entrada e controle Visual _____________________________________
func On_Input_Event():
	pass

func animation():
	pass

func Main():
	pass

# São os metodos que seram usados no codigo do personagem ao herdar essa Classe(Mecanica)
#Funções responsaveis para entrada de Input, COntrole de Animação e Main(Serve como o ready) 
#para definições ao criar o objeto
