programa
{	
	inclua biblioteca Tipos --> t
	inclua biblioteca Util --> u

	const inteiro Tamanho = 5
	const inteiro QuantidadedeMinas = 5

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
		inteiro minas = ContarMinasaoRedor(Mat, linha, coluna)
		se (Mat[linha][coluna] == 1){
			escreva("\nBoom! Vc perdeu.\n\n")
			retorne verdadeiro
		} senao{
			escreva("\ncasa segura.\n\n")
			se (minas == 0){
				Matriz[linha][coluna] = " "
			} senao{
				Matriz[linha][coluna] = t.inteiro_para_cadeia(minas, 10)
			}
			retorne falso
		}
	}

	funcao inteiro ContarMinasaoRedor(inteiro Mat[][], inteiro linha, inteiro coluna){
		
		inteiro contador = 0

    		para (inteiro i = -1; i <= 1; i++)
   		{
        		para (inteiro j = -1; j <= 1; j++)
        		{
           
            		se (i != 0 ou j != 0)
            		{
                		inteiro novaLinha = linha + i
                		inteiro novaColuna = coluna + j

              			se (novaLinha >= 0 e novaLinha < Tamanho e novaColuna >= 0 e novaColuna < Tamanho)
                    	{
                    		se (Mat[novaLinha][novaColuna] == 1)
                    		{
                        			contador++
                    		}
                
                    	}
            		}
        		}
    		}
    		retorne contador
	}

	funcao logico VerificarVitoria(inteiro Mat[][], cadeia Matriz[][]){
		inteiro CasaSegura = 0, CasaAberta = 0
		para(inteiro l = 0; l < Tamanho; l++){
			para(inteiro c = 0; c < Tamanho; c++){
				se (Mat[l][c] != 1){
					CasaSegura++
				}se (Matriz[l][c] != "#") {
					CasaAberta++
				}
			}
		}
		se (CasaSegura == CasaAberta){
			retorne verdadeiro
		}senao{
			retorne falso
		}
	}

	funcao CriarMinas(inteiro Mat[][]){
		inteiro cont = 0, l, c
		enquanto(cont < QuantidadedeMinas){
			l = u.sorteia(0,Tamanho - 1)
			c = u.sorteia(0, Tamanho - 1)
			se (Mat[l][c] == 0){
				Mat[l][c] = 1
				cont++
			}
			
		}
	}
	
	funcao inicio()
	{
		cadeia Matriz[Tamanho][Tamanho]
		logico perdeu = falso, venceu = falso
		inteiro linha = 0, coluna = 0, Mat[Tamanho][Tamanho]
		CriarMatriz(Matriz)
		CriarMinas(Mat)
		MostrarMatriz(Matriz)
		
		enquanto (perdeu == falso e venceu == falso){

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
				venceu = VerificarVitoria(Mat, Matriz)
				MostrarMatriz(Matriz)
				se (venceu){
					escreva("PARABENS\n", "Vc venceu!")
				}
			}				
		}	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2578; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {Mat, 97, 27, 3}-{Mat, 114, 33, 3};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */