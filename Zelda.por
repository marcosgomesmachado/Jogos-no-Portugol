programa
{
  inclua biblioteca Texto --> txt
  inclua biblioteca Util --> u
  
 cadeia matriz[8][12], direcao = "d", Item = "Nenhum"
 inteiro y = 4, x = 4, fase = 0, x_chave, y_chave, x_caixa[3], y_caixa[3]
 logico perdeu = falso, porta_saida = falso, porta_entrada = falso, possui_chave = falso
 
    
  funcao inicio(){
  
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
        x_chave = j
        y_chave = i
      }senao se(fase == 1 e validacao_caixa(j, i)){
        matriz[i][j] = "□"
      }senao{
        matriz[i][j] = "."
      }
   }
  }
    se((possui_chave)){
      matriz[3][11] = "\\"
      matriz[4][11] = "/"
      porta_saida = verdadeiro
    }
    se((fase > 0)){
      matriz[3][0] = "\\"
      matriz[4][0] = "/"
      porta_entrada = verdadeiro
    }
}

  funcao desenha_matriz(){
    limpa()
    escreva("== Colete a chave (+) para passsar de nível ==\n")
    escreva("          ====  Fase ", fase, "  ====\n\n")
    para(inteiro i = 0; i < 8; i++){
      escreva("   ")
    para(inteiro j = 0; j < 12; j++){
      escreva(matriz[i][j], "  ")
    }
    se(i == 7){
      escreva("Item selecionado: ", Item)
    }
    escreva("\n")
    }
  }

  funcao movimentacao(){
  
    escreva("Movimentação: ")
    leia(direcao)
  
    se(direcao == "d"){
      se(possui_chave == verdadeiro e (y == 3 ou y == 4) e x == 10){
        fase++
        porta_saida = falso
        possui_chave = falso
        x = 4
        y = 4
      }senao se(x < 10 e nao validacao_caixa(x + 1, y)){
        x++
      }
    }senao se(direcao == "a" e x >= 1){
      se(porta_entrada e (y == 3 ou y == 4) e x == 1){
        fase--
        x = 10
        y = 4
        possui_chave = falso
        porta_saida = verdadeiro
      }senao se(x < 10 e nao validacao_caixa(x - 1, y)){
        x--
      }
    }senao se(direcao == "w" e y > 1 e nao validacao_caixa(x, y - 1)){
      y--
    }senao se(direcao == "s" e y < 6 e nao validacao_caixa(x, y + 1)){
      y++
    }senao se(direcao == "1"){
    	fase = 1
    }
    se(x == x_chave e y == y_chave){
	 possui_chave = verdadeiro
    }
  }

  funcao logico validacao_caixa(inteiro x_, inteiro y_){
  	se(fase == 1){
  		x_caixa[0] = 1
		y_caixa[0] = 1
		
		x_caixa[1] = 2
		y_caixa[1] = 1
		
		x_caixa[2] = 1
		y_caixa[2] = 2
  	}
  	logico eh_caixa = falso
  	para(inteiro i = 0; i < 3; i++){
	  	se(x_ == x_caixa[i] e y_ == y_caixa[i]){
	        	eh_caixa = verdadeiro
	    	}
  	}
  	retorne eh_caixa
  }
}
