programa{
 inclua biblioteca Texto --> txt
 inclua biblioteca Util --> u
  
 cadeia matriz[8][12], direcao = "d"
 inteiro posicao_atual, y = 4, x = 4, fase = 0, x_chave = u.sorteia(1, 9), y_chave = u.sorteia(1, 9)
 logico perdeu = falso, porta = falso, possui_chave = falso
 
    
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
      matriz[i][j] = "—"
    }senao se(y == i e x == j){
     matriz[i][j] = "#"
    }senao se(i == 1 e j == 7 e nao possui_chave){
	 matriz[i][j] = "+"
    }senao se(y != i ou x != j){
      matriz[i][j] = "."
    }
   }
   se((possui_chave)){
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
  
  se(direcao == "d" e x < 10){
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
    se(x == 7 e y == 1){
		possui_chave = verdadeiro
    }

    posicao_atual = y * 11 + x
 }
}
