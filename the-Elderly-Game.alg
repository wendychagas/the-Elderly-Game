algoritmo ".the.elderly.game."
//-------------------------------------------
procedimento preencherMatriz()
inicio
      para i <- 1 ate 3 faca
          para j <- 1 ate 3 faca
               cont <- cont + 1
               matJogo[i,j] <- numpCarac(cont)
          fimpara
      fimpara
fimprocedimento
//-------------------------------------------
procedimento exibirTabuleiro()
inicio
      escreval("_____________________")
      escreval("<<<---<... ...>--->>>")
      escreval()
      escreval(" the Elderly Game I ")
      escreval("_____________________")
      escreval("<<<---<... ...>--->>>")
      escreval()
      escreval("+-----+-----+-----+")
      para i <- 1 ate 3 faca
          para j <- 1 ate 3 faca
               escreva("|  ")
               escreva(matJogo[i, j]:3)
          fimpara
          escreval("|")
          escreval("+-----+-----+-----+")
      fimpara
      escreval("____________________")
      escreval()
fimprocedimento
//--------------------------------------------
procedimento jogar()
inicio
   x <- "X"
   vencedor <- falso
   contJogada <- 0
   repita
      escreval()
      escreva("< Sua vez >--->> | ", x, " |: ")
      leia(op)
      se (op > 0) e (op < 10) entao
         se (op > 0) e (op < 4) entao
            l <- 1
            se (matJogo[l, op] = "X") ou (matJogo[l, op] = "O") entao
               escreval()
               escreval("< ERRO! Espaço preenchido. >--->>")
            senao
                 matJogo[l, op] <- x
                 codRep()
            fimse
         senao
              se (op > 3) e (op < 7) entao
                 l <- 2
                 se (matJogo[l, op-3] = "X") ou (matJogo[l, op-3] = "O") entao
                    escreval()
                    escreval("< ERRO! Espaço preenchido. >--->>")
                 senao
                      matJogo[l, op-3] <- x
                      codRep()
                 fimse
              senao
                   l <- 3
                   se (matJogo[l, op-6] = "X") ou (matJogo[l, op-6] = "O") entao
                      escreval()
                      escreval("< ERRO! Espaço preenchido. >--->>")
                   senao
                        matJogo[l, op-6] <- x
                        codRep()
                   fimse
              fimse
         fimse
      senao
           escreval()
           escreval("< ERRO! Jogada inválida. >--->>")
      fimse
      limpatela
      exibirTabuleiro()
   ate (contJogada = 9) ou (vencedor = verdadeiro)
   se (vencedor = verdadeiro) entao
      escreval()
      escreval("Jogador ", x, " venceu! ")
   senao
        escreval()
        escreval("Deu Velha!")
   fimse
fimprocedimento
//--------------------------------------------
//procedimento mostrarJogadaDisponivel()
//inicio
      //para i <- 1 ate 9 faca
           //cont2 <- cont2 + 1
           //vetJogDisp[i] <- numpCarac(cont2)
      //fimpara

      //escreval("____________________________________________")
      //para i <- 1 ate 9 faca
           //escreva("| ", vetJogDisp[i], "| ")
      //fimpara
      //escreval()
//fimprocedimento
//--------------------------------------------
procedimento codRep()
inicio
      vencedor <- verificarVencedor()
      contJogada <- contJogada + 1
      se (vencedor = falso) entao
         se (contJogada % 2 <> 0) entao
            x <- "O"
         senao
              x <- "X"
         fimse
      fimse
fimprocedimento
//--------------------------------------------
funcao verificarVencedor(): Logico
var
   venceu: Logico
inicio
      venceu <- falso

      //horizontal;
      para i <- 1 ate 3 faca
           se ((matJogo[i,1] = matJogo[i,2]) e (matJogo[i,2] = matJogo[i,3])) entao
              venceu <- verdadeiro
           fimse
      fimpara

      //vertical;
      para i <- 1 ate 3 faca
           se ((matJogo[1,i] = matJogo[2,i]) e (matJogo[2,i] = matJogo[3,i])) entao
              venceu <- verdadeiro
           fimse
      fimpara

      //diagonal 1;
      para i <- 1 ate 3 faca
           se ((matJogo[1,1] = matJogo[2,2]) e (matJogo[2,2] = matJogo[3,3])) entao
              venceu <- verdadeiro
           fimse
      fimpara

      //diagonal 2;
      para i <- 1 ate 3 faca
           se ((matJogo[1,3] = matJogo[2,2]) e (matJogo[2,2] = matJogo[3,1])) entao
              venceu <- verdadeiro
           fimse
      fimpara

      retorne venceu
fimfuncao
//--------------------------------------------
var
   matJogo: vetor[1..3, 1..3] de Caracter
   vetJogDisp: vetor[1..9] de Caracter
   i, j, cont, cont2, op, l, contJogada: Inteiro
   x: Caracter
   vencedor: Logico
inicio
cont <- 0
//cont2 <- 0
preencherMatriz()
exibirTabuleiro()
//mostrarJogadaDisponivel()
jogar()
fimalgoritmo
