programa
{	
	inclua biblioteca Tipos --> t
	inclua biblioteca Util --> u

	const inteiro Tamanho = 5
	const inteiro QuantidadedeMinas = 5

	funcao inteiro ContarTempo(){
		inteiro tempo = 0
		tempo = u.tempo_decorrido()
		retorne tempo
	}

	funcao CriarMatriz(cadeia Matriz[][]){
		inteiro l, c
		para(l = 0; l < Tamanho; l++){
			para(c = 0; c < Tamanho; c++){
				Matriz[l][c] = "#"	
			}
		}
	}

	funcao CriarFlags(logico Flag[][]){
		inteiro l, c
		para(l = 0; l < Tamanho; l++){
			para(c = 0; c < Tamanho; c++){
				Flag[l][c] = falso
			}
		}
	}

	funcao MostrarMatriz(cadeia Matriz[][], logico Flag[][], inteiro MinasRestantes){
		inteiro l, c
		escreva("\nMinas restantes: ", MinasRestantes, "\n\n")
		escreva("    ")
		para(l = 0; l < Tamanho; l++){
			escreva(l + 1, "    ")
		}
		escreva("\n")
		para(l = 0; l < Tamanho; l++){
			escreva(l+1, "|")
			para(c = 0; c < Tamanho; c++){
				se (Flag[l][c] == verdadeiro){
					escreva("[ P ]")
				} senao {
					escreva("[ ", Matriz[l][c], " ]")
				}
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
			inteiro minas = ContarMinasaoRedor(Mat, linha, coluna)
			se (minas == 0){
				AbrirCasasVazias(Matriz, Mat, linha, coluna)
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
					se (Matriz[l][c] != "#") {
						CasaAberta++
					}
				}
			}
		}
		retorne CasaSegura == CasaAberta
	}

	funcao CriarMinas(inteiro Mat[][], inteiro linha, inteiro coluna){
		inteiro cont = 0, l, c
		para(l = 0; l < Tamanho; l++){
			para(c = 0; c < Tamanho; c++){
				Mat[l][c] = 0
			}
		}
		enquanto(cont < QuantidadedeMinas){
			l = u.sorteia(0,Tamanho - 1)
			c = u.sorteia(0, Tamanho - 1)
			se (l != linha ou c != coluna){
				 se (Mat[l][c] == 0){
					Mat[l][c] = 1
					cont++
				}
			}
		}
	}

	funcao RevelarMinas(cadeia Matriz[][], inteiro Mat[][]){
		para(inteiro l = 0; l < Tamanho; l++){
			para(inteiro c = 0; c < Tamanho; c++){
				se (Mat[l][c] == 1) {
					Matriz[l][c] = "X"
				}
			}
		}
	}

	funcao AbrirCasasVazias(cadeia Matriz[][], inteiro Mat[][], inteiro linha, inteiro coluna){

	
	se (linha < 0 ou linha >= Tamanho){
		retorne
	}

	se (coluna < 0 ou coluna >= Tamanho){
		retorne
	}

	
	se (Mat[linha][coluna] == 1){
		retorne
	}

	
	se (Matriz[linha][coluna] != "#"){
		retorne
	}

	inteiro minas = ContarMinasaoRedor(Mat, linha, coluna)

	
	se (minas > 0){
		Matriz[linha][coluna] = t.inteiro_para_cadeia(minas, 10)
		retorne
	}

	
	Matriz[linha][coluna] = " "

	
	AbrirCasasVazias(Matriz, Mat, linha-1, coluna-1)
	AbrirCasasVazias(Matriz, Mat, linha-1, coluna)
	AbrirCasasVazias(Matriz, Mat, linha-1, coluna+1)

	AbrirCasasVazias(Matriz, Mat, linha, coluna-1)
	AbrirCasasVazias(Matriz, Mat, linha, coluna+1)

	AbrirCasasVazias(Matriz, Mat, linha+1, coluna-1)
	AbrirCasasVazias(Matriz, Mat, linha+1, coluna)
	AbrirCasasVazias(Matriz, Mat, linha+1, coluna+1)
}
	
	funcao inicio()
	{
		cadeia Matriz[Tamanho][Tamanho]
		logico perdeu = falso, venceu = falso, primeiraJogada = verdadeiro
		logico Flag[Tamanho][Tamanho]
		inteiro linha = 0, coluna = 0, Mat[Tamanho][Tamanho]
		inteiro acao = 0, tempoDecorrido = 0
		inteiro MinasRestantes = QuantidadedeMinas

		CriarMatriz(Matriz)
		CriarFlags(Flag)
		MostrarMatriz(Matriz, Flag, MinasRestantes)
		
		enquanto (perdeu == falso e venceu == falso){

			enquanto (verdadeiro){
				escreva("\n\nDigite 1 para abrir uma casa ou 2 para marcar/desmarcar bandeira: ")
				leia(acao)
				se (acao != 1 e acao != 2){
					escreva("Opcao invalida.\n\n")
				}senao{
					pare
				}
			}

			enquanto (verdadeiro){
				escreva("\n\nInforme qual linha vc deseja selecionar: ")
				leia(linha)
				se (linha < 1 ou linha > Tamanho){
					escreva("numero invalido.\n\n")
					MostrarMatriz(Matriz, Flag, MinasRestantes)
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
					MostrarMatriz(Matriz, Flag, MinasRestantes)
				}senao{
					coluna--
					pare
				}	
			}

			se (acao == 2){
				se (Matriz[linha][coluna] != "#"){
					escreva("\nCasa ja aberta, nao pode marcar bandeira.\n")
				} senao {
					se (Flag[linha][coluna] == verdadeiro){
						Flag[linha][coluna] = falso
						MinasRestantes++
					} senao {
						se (MinasRestantes > 0){
							Flag[linha][coluna] = verdadeiro
							MinasRestantes--
						} senao {
							escreva("\nVoce ja marcou todas as bandeiras disponiveis.\n")
						}
					}
				}
				MostrarMatriz(Matriz, Flag, MinasRestantes)
			}
			senao{
				se (Flag[linha][coluna] == verdadeiro){
					escreva("\nRemova a bandeira antes de abrir esta casa.\n")
					MostrarMatriz(Matriz, Flag, MinasRestantes)
				}
				senao se (Matriz[linha][coluna] != "#"){
					escreva("\nCasa ja ocupada. Escolha outra casa.\n")
					MostrarMatriz(Matriz, Flag, MinasRestantes)
				}
				senao{
					se (primeiraJogada == verdadeiro){
						CriarMinas(Mat, linha, coluna)
						primeiraJogada = falso
						
						}
					perdeu = AbrirCasa(Matriz, Mat, linha, coluna)
					se (perdeu){
						RevelarMinas(Matriz, Mat)
						
					} senao{
						venceu = VerificarVitoria(Mat, Matriz)
						
						se (venceu){
							escreva("PARABENS\n", "Vc venceu!")
						}
					}
					MostrarMatriz(Matriz, Flag, MinasRestantes)
				}				
			}
		}
		
		ContarTempo()
		tempoDecorrido = ContarTempo() * 0.001
		escreva("O tempo durante o jogo foi: ", tempoDecorrido, " segundos.")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6726; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {tempo, 10, 10, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
