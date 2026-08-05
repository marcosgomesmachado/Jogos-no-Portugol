programa{
 inclua biblioteca Texto --> txt
 inclua biblioteca Util --> u
  
 cadeia matriz[8][12], direcao = "d"
 inteiro posicao_atual, y = u.sorteia(1, 6), x = u.sorteia(1, 9), fase = 0
 logico perdeu = falso, porta = falso
 
    
 funcao inicio(){

  posicao_atual = y * 11 + x
  
  enquanto(nao perdeu){
   define_caractere()
   desenha_matriz()
   movimentacao()
  }
 }

 funcao define_caractere(){
  para(inteiro i = 0; i < 8; i++){
   para(inteiro j = 0; j < 12; j++){
    se(j == 11 ou j == 0){
     matriz[i][j] = "|"
    }senao se(i == 7 ou i == 0){
      matriz[i][j] = "-"
    }senao se(y == i e x == j){
     matriz[i][j] = "#"
    }senao se(y != i ou x != j){
      matriz[i][j] = "."
    }
   }
   se((y == 3 ou y == 4) e x == 10){
      matriz[3][11] = "\\"
      matriz[4][11] = "/"
      porta = verdadeiro
    }
  }
 }

 funcao desenha_matriz(){
  limpa()
  para(inteiro i = 0; i < 8; i++){
   para(inteiro j = 0; j < 12; j++){
    escreva(matriz[i][j], "  ")
   }
  escreva("\n")
  }
 }

 funcao movimentacao(){
  
  escreva("Movimentação: ")
  leia(direcao)
  
  se(direcao == "d" e x < 10 e nao porta){
      x++
    }senao se(direcao == "a" e x > 1){
      x--
    }senao se(direcao == "w" e y > 1){
      y--
    }senao se(direcao == "s" e y < 6){
      y++
    }senao{
      fase++
      porta = falso
    }

    posicao_atual = y * 11 + x
 }
}
