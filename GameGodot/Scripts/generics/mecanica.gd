extends KinematicBody2D
#Variaveis de controle de mecanica/Fisica
var acceleration = 0
var slowdown = 0
var velocityMax = 0
var velocityMin = 0
var GRAVITY = 0
var UP = Vector2()
var jumpingForce = 0
var secondJumpingForce = 0

#Variaveis de controle/permissao de funcionabilidade
export var visionDIR = false; 
export var permissionSecondJump = false
export var permissionAutoFlip = true

#Variaveis de controle de Direção e movimento
var velocity = 0
var targetVelocity = 0
var entryDir = Vector2()
var currentDir = Vector2()
var move = Vector2()
var gravity = 0

#Variaveis de Status do personagem
var statusList = ["Parado", "Andando", "Pulando", "Caindo"]

var statusSecondJump = true
var Floor = true
var beFloor = false
var status = ""

#Metodo Principal, que sera o primeiro a ser chamado no codigo
func _ready():
	
	set_process_input(true)
	set_physics_process(true)
	Main()
	pass

#Metodo de controle do Status do Personagem
func status():
	
	if Floor and entryDir.x != 0:
		status = statusList[1]
		
	elif Floor and entryDir.x == 0 and velocity == 0:
		status = statusList[0]
		
	elif !Floor and gravity > 0:
		status = statusList[2]
		
	elif !Floor and gravity < 0:
		status = statusList[3]

#Metodo de controle de movimentação Horizontal
func move_x(delta):
	if permissionAutoFlip:
		if entryDir.x == 1:
			$body.set_flip_h(visionDIR)
			pass
		elif entryDir.x == -1:
			$body.set_flip_h(!visionDIR)
			pass
	if acceleration == 0:
		currentDir.x = entryDir.x
		velocity = currentDir.x * velocityMin
	else:
		if entryDir.x != 0:
			currentDir.x = entryDir.x
			if targetVelocity != velocityMax:
				targetVelocity = velocityMax
		else:
			targetVelocity = 0
		
		var variation = slowdown * delta
		if(entryDir.x != 0):
			variation = acceleration * delta
		velocity = interpolacaoLinear(velocity,targetVelocity * entryDir.x,variation)
		
	
	pass


#Metodo de controle de movimentação vertical
func move_y():
	
	if entryDir.y == -1 and Floor:
		jump(jumpingForce)
	elif entryDir.y == -1 and permissionSecondJump == true:
		if statusSecondJump == false:
			jump(secondJumpingForce)
			statusSecondJump = true
	pass

#Metodo de pulo
func jump(valor):
	gravity = valor
	pass


func interpolacaoLinear(currentVelocity, targetVelocity, variation):
	var dif = targetVelocity - currentVelocity
	
	if dif > variation:
		return currentVelocity + variation
	
	if dif < -variation:
		return currentVelocity - variation
	
	return targetVelocity







#Metodo de processo circular/60fps
func _physics_process(delta):
	
	On_Input_Event()
	move_x(delta)
	move_y()
	status()
	Floor = is_on_floor()
	animation()
	
	
	
	
	if Floor == true and beFloor == true and entryDir.y == 0:
		statusSecondJump = false
		gravity = -30
	elif is_on_ceiling():
		gravity = 0
		gravity += GRAVITY * delta
	else:
		gravity += GRAVITY * delta
	
	
	if UP.y != 0:
		move = Vector2(velocity, UP.y * gravity)
		pass
	elif UP.x != 0:
		move = Vector2(UP.x * gravity,velocity)
		pass
	
	
	

	
	move_and_slide(move, UP)
	
	
	
	
	beFloor = Floor
	



func getStatus():
	return status


func getFloor():
	return Floor

func getBeFloor():
	return beFloor

func setStatusSecondJump(valor):
	statusSecondJump = valor

func getStatusSecondJump():
	return statusSecondJump

func setTargetVelocity(valor):
	targetVelocity = valor


















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
