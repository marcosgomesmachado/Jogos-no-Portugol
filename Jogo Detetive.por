programa
{

	inclua biblioteca Util --> u
	
    funcao inicio()
    {
        inteiro opcaoMenu

        DesenhaTelaCarregamento()

  	   u.aguarde(500000)
        exibirTitulo()

        faca
        {
            exibirMenu()
            leia(opcaoMenu)

            escolha(opcaoMenu)
            {
                caso 1:
                    iniciarJogo()
                pare
                caso 2:
                    exibirInstrucoes()
                pare
                caso 3:
                    escreva("\nAté a próxima, detetive.\n")
                pare
                caso contrario:
                    escreva("\nOpção inválida. Tente novamente.\n")
                pare
            }
        }enquanto(opcaoMenu != 3)
    }

    funcao DesenhaTelaCarregamento(){
		escreva("╔══════════════════════════════════════════════╗\n")
		escreva("║          INICIALIZANDO SISTEMA...            ║\n")
		escreva("╠══════════════════════════════════════════════╣\n")
		escreva("║                                              ║\n")
		escreva("║  [✓] Carregando arquivos...          	       ║\n")
		escreva("║  [✓] Verificando configurações...            ║\n")
		escreva("║  [✓] Inicializando módulos...   	       ║\n")
		escreva("║  [✓] Preparando ambiente... 		       ║\n")
		escreva("║                                              ║\n")
		escreva("║  PROGRESSO                                   ║\n")
		escreva("║  ████████████████████████████████████ 100%   ║\n")
		escreva("║                                              ║\n")
		escreva("║              SISTEMA PRONTO!                 ║\n")
		escreva("╚══════════════════════════════════════════════╝\n")
    }

    funcao exibirTitulo()
    {
        escreva("=========================================\n")
        escreva("        ARQUIVO 13 - CASOS OCULTOS\n")
        escreva("=========================================\n\n")
    }

    funcao exibirMenu()
    {
        escreva("------------------------------\n")
        escreva("1 - Novo Caso\n")
        escreva("2 - Instruções\n")
        escreva("3 - Sair\n")
        escreva("------------------------------\n")
        escreva("Escolha uma opção: ")
    }

    funcao exibirInstrucoes()
    {
        escreva("\nVocê é um detetive particular chamado para investigar\n")
        escreva("crimes que a polícia não conseguiu resolver.\n")
        escreva("Examine pistas, interrogue suspeitos e faça a acusação\n")
        escreva("certa antes que o culpado escape.\n")
        escreva("Digite o número da opção desejada e pressione ENTER.\n\n")
    }

    funcao iniciarJogo()
    {
        logico pistaSangue, pistaBilhete, pistaTestemunha
        inteiro escolha1, totalPistas
        
        pistaSangue = falso
        pistaBilhete = falso
        pistaTestemunha = falso
        totalPistas = 0

        escreva("\n\n")
        escreva("  _____________________ \n")
        escreva(" |                     | \n")
        escreva(" |  X  CENA DO CRIME X |  \n")
        escreva(" |_____________________| \n\n")
        escreva("Você chega a mansâo Rosemont. O corpo do Sr. Aldric\n")
        escreva("Rosemont foi encontrado na biblioteca, caído perto\n")
        escreva("da lareira. A polícia isolou o local e aguarda você.\n\n")

        faca
        {
            escreva("\n--- O que deseja examinar? ---\n")
            escreva("1 - Manchas de sangue perto da lareira\n")
            escreva("2 - Um bilhete amassado sobre a mesa\n")
            escreva("3 - Conversar com a governanta (testemunha)\n")
            escreva("4 - Encerrar investigação no local e seguir\n")
            escreva("Escolha: ")
            leia(escolha1)

            escolha(escolha1)
            {
                caso 1:
                    se(pistaSangue == falso)
                    {
                        escreva("\nAs manchas indicam que o corpo foi arrastado\n")
                        escreva("cerca de dois metros antes de parar na lareira.\n")
                        pistaSangue = verdadeiro
                    }
                    senao
                    {
                        escreva("\nVocê ja examinou esse local.\n")
                    }
                pare
                caso 2:
                    se(pistaBilhete == falso)
                    {
                        escreva("\nO bilhete diz: 'Se você contar, será o próximo.'\n")
                        escreva("A letra parece feminina, escrita com tinta vermelha.\n")
                        pistaBilhete = verdadeiro
                    }
                    senao
                    {
                        escreva("\nVocê já leu esse bilhete.\n")
                    }
                pare
                caso 3:
                    se(pistaTestemunha == falso)
                    {
                        escreva("\nA governanta diz, nervosa: 'Ouvi gritos por volta\n")
                        escreva("das 22h, mas a porta da biblioteca estava trancada.'\n")
                        pistaTestemunha = verdadeiro
                    }
                    senao
                    {
                        escreva("\nEla não tem mais nada a dizer.\n")
                    }
                pare
                caso 4:
                    escreva("\nVocê decide que já tem informaçôes suficientes.\n")
                pare
                caso contrario:
                    escreva("\nOpçâo inválida.\n")
                pare
            }
        }enquanto(escolha1 != 4)

        se(pistaSangue == verdadeiro)
        {
            totalPistas = totalPistas + 1
        }
        se(pistaBilhete == verdadeiro)
        {
            totalPistas = totalPistas + 1
        }
        se(pistaTestemunha == verdadeiro)
        {
            totalPistas = totalPistas + 1
        }

        escreva("\nVocê coletou ", totalPistas, " de 3 pistas nesta cena.\n")
        escreva("(Próxima etapa: interrogatorio dos suspeitos - em construcao)\n")
        
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 8333; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
