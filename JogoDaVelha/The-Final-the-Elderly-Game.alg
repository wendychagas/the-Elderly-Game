algoritmo "JogoDaVelha"
//-----------------------------------

procedimento preencherMatriz()
inicio
      para i <- 1 ate 3 faca
          para j <- 1 ate 3 faca
               cont <- cont + 1
               jogo[i, j] <- numpCarac(cont)
          fimpara
      fimpara
fimprocedimento

//-----------------------------------

procedimento tabuleiroVelha()
inicio
      escreval("___________________")
      escreval()
      escreval(" the Elderly Game ")
      escreval("___________________")
      escreval()
      escreval("+-----+-----+-----+")
      para i <- 1 ate 3 faca
          para j <- 1 ate 3 faca
               escreva("|  ")
               escreva(jogo[i, j]:3)
          fimpara
          escreval("|")
          escreval("+-----+-----+-----+")
      fimpara
      escreval("___________________")
fimprocedimento

//-----------------------------------

procedimento jogar()
inicio
   jogador <- "X"
   vencedor <- falso
   contJogada <- 0
   repita
      escreval()
      escreva(jogador, " - Faça sua jogada: ")
      leia(op)
      //Verificar se o número está entre 1 e 9;
      se (op > 0) e (op < 10) entao
         se (op > 0) e (op < 4) entao
            l <- 1
            se (jogo[l, op] = "X") ou (jogo[l, op] = "O") entao
               escreval()
               escreval("* Este espaço já foi preenchido.")
               escreva("* Pressione ENTER para continuar.")
               leia(enter)
            senao
                 jogo[l, op] <- jogador
                 codRepetido()
            fimse
         senao
              se (op > 3) e (op < 7) entao
                 l <- 2
                 se (jogo[l, op-3] = "X") ou (jogo[l, op-3] = "O") entao
                    escreval()
                    escreval("* Este espaço já foi preenchido.")
                    escreva("* Pressione ENTER para continuar.")
                    leia(enter)
                 senao
                      jogo[l, op-3] <- jogador
                      codRepetido()
                 fimse
              senao
                   l <- 3
                   se (jogo[l, op-6] = "X") ou (jogo[l, op-6] = "O") entao
                      escreval()
                      escreval("* Este espaço já foi preenchido.")
                      escreva("* Pressione ENTER para continuar.")
                      leia(enter)
                   senao
                        jogo[l, op-6] <- jogador
                        codRepetido()
                   fimse
              fimse
         fimse
      senao
           escreval()
           escreval("* Opção inválida.")
           escreva("* Pressione ENTER para continuar.")
           leia(enter)
      fimse
      limpatela
      tabuleiroVelha()
   ate(vencedor = verdadeiro) ou (ContJogada = 9)
   se (vencedor = verdadeiro) entao
      escreval()
      escreval("Jogador ", jogador, " venceu! ")
   senao
        escreval()
        escreval("Deu Velha!")
   fimse
fimprocedimento

//-----------------------------------

procedimento codRepetido()
inicio
      vencedor <- verificarVencedor(): Logico // em breve
      contJogada <- ContJogada + 1
      se (vencedor = falso) entao
         se (contJogada % 2 <> 0) entao
            jogador <- "O"
         senao
              jogador <- "X"
         fimse
      fimse
fimprocedimento

//-----------------------------------

funcao verificarVencedor(): Logico
var
   venceu: Logico
inicio
      venceu <- falso
      
      //horizontal;
      para i <- 1 ate 3 faca
           se ((jogo[i,1] = jogo[i,2]) e (jogo[i,2] = jogo[i,3])) entao
              venceu <- verdadeiro
           fimse
      fimpara
      
      //vertical;
      para i <- 1 ate 3 faca
           se ((jogo[1,i] = jogo[2,i]) e (jogo[2,i] = jogo[3,i])) entao
              venceu <- verdadeiro
           fimse
      fimpara
      
      //diagonal 1;
      para i <- 1 ate 3 faca
           se ((jogo[1,1] = jogo[2,2]) e (jogo[2,2] = jogo[3,3])) entao
              venceu <- verdadeiro
           fimse
      fimpara
      
      //diagonal 2;
      para i <- 1 ate 3 faca
           se ((jogo[1,3] = jogo[2,2]) e (jogo[2,2] = jogo[3,1])) entao
              venceu <- verdadeiro
           fimse
      fimpara
      
      retorne venceu
fimfuncao

//-----------------------------------

var
   jogo: vetor[1..3, 1..3] de Caracter
   i, j, cont, op, l: Inteiro
   jogador, enter: Caracter
   contJogada: Inteiro
   vencedor: Logico
inicio
cont <- 0
preencherMatriz()
tabuleiroVelha
jogar()
fimalgoritmo
