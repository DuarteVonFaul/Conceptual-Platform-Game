# Conceptual-Platform-Game

Nesse projeto tenho como principal objetivo produzir uma pequena fase de um jogo de Plataforma com a seguinte regra:

        O codigo de mecânica deve ser compartilhado por todos os personagens independe das suas peculiaridades de movimento
        

## 1. GameEngine

Nesse Projeto usarei a GodotEngine, uma engine OpenSoucer que ultiliza uma linguagem propria chamada GDScript(GodotScript) que tem uma sintaxe muito similar ao python. Caso haja algum interesse sobre a engine seguir o [link](godotengine.org/) da pagina principal da Godot.


## 2. Projeto

![GodotEngine)](https://user-images.githubusercontent.com/50261190/159534674-bd61a00b-382a-46eb-91a3-61e8fae2172a.png)

## 3. Personagens

https://user-images.githubusercontent.com/50261190/159541269-b5b75fde-4541-4e84-8cfe-d0c9bb05741e.mp4




## 4. Como Implementar um novo Personagem

Para construir um Simples pensonagem basta organizar dentro da seguinte estrutura



        extends "res://Scripts/generics/mecanica.gd"
        func Main():
        
                velocityMin = Int or Float
                GRAVITY = Int or Float negative
                UP = Vector2(0,-1)
                jumpingForce = Int or Float
                
                pass

        func On_Input_Event():

                Aqui você vai gerar as regras de Input se é uma colisão ou uma aproximação

                pass


        func animation():

                Aqui você vai produzir suas regras de animação

                pass
                

## Funcionalidades Extras

**MAIN:**

Essas funcionalidades são habilitadas no momento que inseridas suas variaveis na função main

***interpolação Linear***
- *acceleration* (se usado um valor maior que zero, o personagem vai se mover com uma aceleração)
- *slowdown*     (se a acceleration for usada, o slowdown também tem que ser incluida)
- *velocityMax*  (se a acceleration for usada, o velocityMax também tem que ser incluida)


***Segundo pulo no ar***
- *secondJumpingForce* (valor usado para caso seja habilitado a função de segundo pulo no ar)  

---- 

**Getters and Setters:**

- *getStatus()*  (te retorna o status atual do personagem)
- *getFloor()*   (te retorna se o personagem está colidindo com o chão)
- *getBeFloor()* (Essa função ela funciona como um status anterior ao Floor, ou seja se anteriormente ele já estava no chão)
- *setStatusSecondJump(boolean)* (aqui você altera o status do segundo pulo, ou seja, se ele já deu o segundo pulo ou não)
- *getStatusSecondJump()* (aqui você recebe o status do segundo pulo)
- *setTargetVelocity(int||float)* (aqui você altera o valor alvo só utilizado na movimentação com interpolação Linear)
----

**Também exite permissões que podem ser alteradas no Inpector dos personagems**


![permission](https://user-images.githubusercontent.com/50261190/160908264-cc7875eb-e532-4728-8a02-0013b8fd1e36.png)
-----
- *Vision Dir*             (caso o seu personagem está flipando a arte para o lado errado, ative essa funcionalidade)
- *Permission Auto Flip*   (Ao ativar essa permissão o codigo vai flipar automaticamente as artes para você)
- *Permission Second Jump* (Ao ativar essa permissão seu personagem habilida a funcionalidade de segundo pulo)


## 5. Arte:

As artes usadas podem ser facilmente encontradas no [Link do Artista](https://opengameart.org/content/arcade-platformer-assets)

## 6. Autores:
  
- **Guilherme Duarte Sousa** - [Linkedin](https://www.linkedin.com/in/guilherme-duarte-sousa-53639822b/) | [Github](https://github.com/DuarteVonFaul/) | [Facebook](https://www.facebook.com/DuarteVonFaul/)
