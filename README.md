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

Para construir um novo pensonagem basta organizar dentro da seguinte estrutura



        extends "res://Scripts/generics/mecanica.gd"
        func Main():
                ACELERACAO = ValorNumerico
                VEL_MAXIMA = ValorNumerico
                VEL_MINIMA = ValorNumerico
                GRAVIDADE = ValorNumerico(Negativo)
                UP = Vector2(direcional para Teto)
                direcao_entrada.x = ValorNumerico(Entre 1 e -1)
                direcao_visao_direita = Boolean(True esquerda || false direita)


                pass

        func On_Input_Event():

                Aqui você vai gerar as regras de Input se é uma colisão ou uma aproximação

                pass


        func animation():


                Aqui você vai produzir suas regras de animação

                pass
                

Existe algumas funcionalidades internas que podem ser chamadas como:

- status => vai te retornar o status do player entre ("Parado", "Andando", "Pulando", "Caindo")
- chao => vai te retornar se o player está no chão ou não
- permissao_segundo_pulo => caso esteja em True o player tem permissão de dar pulo duplo


## 5. Arte:

As artes usadas podem ser facilmente encontradas no [Link do Artista](https://opengameart.org/content/arcade-platformer-assets)

## 6. Autores:
  
- **Guilherme Duarte Sousa** - [Linkedin](https://www.linkedin.com/in/guilherme-duarte-sousa-53639822b/) | [Github](https://github.com/DuarteVonFaul/) | [Facebook](https://www.facebook.com/DuarteVonFaul/)
