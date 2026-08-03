programa
{	

	const inteiro Tamanho = 3

	funcao CriarMatriz(cadeia Matriz[][]){
		inteiro l, c
		para(l = 0; l < Tamanho; l++){
			para(c = 0; c < Tamanho; c++){
				Matriz[l][c] = "#"	
			}
		}
	}

	funcao MostrarMatriz(cadeia Matriz[][]){
		inteiro l, c
		escreva("    ")
		para(l = 0; l < Tamanho; l++){
			escreva(l + 1, "    ")
		}
		escreva("\n")
		para(l = 0; l < Tamanho; l++){
			escreva(l+1, "|")
			para(c = 0; c < Tamanho; c++){
				escreva("[ ", Matriz[l][c], " ]")
				
			}
			escreva("\n")
		}
	}

	funcao logico AbrirCasa(cadeia Matriz[][], inteiro Mat[][], inteiro linha, inteiro coluna){
		se (Mat[linha][coluna] == 1){
			escreva("\nBoom! Vc perdeu.\n\n")
			retorne verdadeiro
		} senao{
			escreva("\ncasa segura.\n\n")
			Matriz[linha][coluna] = " "
			retorne falso
		}
	}

	funcao inicio()
	{
		cadeia Matriz[Tamanho][Tamanho]
		logico perdeu = falso
		inteiro linha = 0, coluna = 0, Mat[Tamanho][Tamanho] = {
		{0, 0, 0},
		{0, 1, 0},
		{0, 0, 0}
		}
		CriarMatriz(Matriz)
		MostrarMatriz(Matriz)
		
		enquanto (perdeu == falso){

			enquanto (verdadeiro){
				escreva("\n\nInforme qual linha vc deseja selecionar: ")
				leia(linha)
				se (linha < 1 ou linha > Tamanho){
					escreva("numero invalido.\n\n")
					MostrarMatriz(Matriz)
				}senao{
					linha--
					pare				
				}
			}

			enquanto (verdadeiro){
				escreva("\n\nInforme qual coluna vc deseja selecionar: ")
				leia(coluna)
				se (coluna < 1 ou coluna > Tamanho){
					escreva("Numero invalido.\n\n")
					MostrarMatriz(Matriz)
				}senao{
					coluna--
					pare
				}	
			}
			se (Matriz[linha][coluna] == " "){
				escreva("\nCasa ja ocupada. Escolha outra casa")
			}
			senao{
				perdeu = AbrirCasa(Matriz, Mat, linha, coluna)
				MostrarMatriz(Matriz)
			}				
		}	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 880; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */