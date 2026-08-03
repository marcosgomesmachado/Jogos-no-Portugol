programa{
	inclua biblioteca Teclado --> t
	inclua biblioteca Texto --> txt
	inclua biblioteca Util --> u
  
	cadeia matriz[5][10], direcao = "d"
	inteiro posicao_atual, y = u.sorteia(0, 4), x = u.sorteia(0, 9)
	logico perdeu = falso
    
	funcao inicio(){
  	
		posicao_atual = y * 10 + x
    
		enquanto(nao perdeu){
			define_caractere()
			desenha_matriz()
			movimentacao()
		}
	}

	funcao define_caractere(){
		para(inteiro i = 0; i < 5; i++){
			para(inteiro j = 0; j < 10; j++){
				se(y == i e x == j){
					matriz[i][j] = "#"
				}senao{
					matriz[i][j] = "·"
				}
			}
		}
	}

	funcao desenha_matriz(){
		limpa()
		para(inteiro i = 0; i < 5; i++){
			para(inteiro j = 0; j < 10; j++){
				escreva(matriz[i][j], "  ")
			}
		escreva("\n")
		}
	}

	funcao movimentacao(){
		se(x > 9 ou y > 4 ou x < 0 e y < 0){
  			perdeu = verdadeiro
  		}
		
		leia(direcao)
  		
		se(direcao == "d"){
  			x++
  		}senao se(direcao == "a"){
  			x--
  		}senao se(direcao == "w"){
  			y--
  		}se(direcao == "s"){
  			y++
  		}
  		
  		posicao_atual = y * 10 + x
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 757; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */