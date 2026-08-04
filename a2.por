programa
{
	cadeia convidados[100]
	
	funcao inicio()
	{
		inteiro escolha_, pos = 0
		cadeia nome

		faca{
			escreva("\n\n----------MENU----------")
			escreva("\n[ 1 ] Cadastrar novo convidado;")
			escreva("\n[ 2 ] Listar todos os convidados;")
			escreva("\n[ 3 ] Remover pessoa;")
			escreva("\n[ 4 ] Sair.\n")
			escreva("\nEscolha: ")
			leia(escolha_)
			
			escolha(escolha_){

				caso 1:
					pos = cadastrar(pos)
					limpa()
				pare

				caso 2:
					listar(pos)
				pare

				caso 3: 
					remover(pos)
				pare

				caso 4:
					limpa()
					escreva("A lista final de convidados é: \n")
					listar(pos)
					pos = 100
				pare
			}
		}enquanto(pos < 100)
	}

	funcao inteiro cadastrar(inteiro pos){
		cadeia nome

		escreva("\n\nInsira o nome do convidado a ser adicionado: ")
		leia(nome)

		convidados[pos] = nome
		pos++
		
		retorne pos
	}

	funcao listar(inteiro pos){
		se(pos != 0){
			para(inteiro i = 0; i < pos; i++){
				escreva("\n----------CONVIDADOS----------\n", convidados[i])
			}
		}senao{
			escreva("\nNão há convidados ainda\n")
		}
	}

	funcao remover(inteiro pos){
		cadeia nome

		escreva("\n\nInsira o nome do convidado a ser removido: ")
		leia(nome)

		
		para(inteiro i = pos; i >= 0; i--){
			se(convidados[i] == nome){
				convidados[i] = ""
				pos--
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 635; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */