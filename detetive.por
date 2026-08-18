programa
{
    funcao inicio()
    {
        inteiro opcaoMenu

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
                    escreva("\nAte a proxima, detetive.\n")
                pare
                caso contrario:
                    escreva("\nOpcao invalida. Tente novamente.\n")
                pare
            }
        }enquanto(opcaoMenu != 3)
    }

    funcao vazio exibirTitulo()
    {
        escreva("=========================================\n")
        escreva("        ARQUIVO 13 - CASOS OCULTOS\n")
        escreva("=========================================\n\n")
    }

    funcao vazio exibirMenu()
    {
        escreva("------------------------------\n")
        escreva("1 - Novo Caso\n")
        escreva("2 - Instrucoes\n")
        escreva("3 - Sair\n")
        escreva("------------------------------\n")
        escreva("Escolha uma opcao: ")
    }

    funcao vazio exibirInstrucoes()
    {
        escreva("\nVoce e um detetive particular chamado para investigar\n")
        escreva("crimes que a policia nao conseguiu resolver.\n")
        escreva("Examine pistas, interrogue suspeitos e faca a acusacao\n")
        escreva("certa antes que o culpado escape.\n")
        escreva("Digite o numero da opcao desejada e pressione ENTER.\n\n")
    }

    funcao vazio iniciarJogo()
    {
        logico pistaSangue
        logico pistaBilhete
        logico pistaTestemunha
        inteiro escolha1
        inteiro totalPistas

        pistaSangue = falso
        pistaBilhete = falso
        pistaTestemunha = falso
        totalPistas = 0

        escreva("\n\n")
        escreva("  _____________________ \n")
        escreva(" |  X  CENA DO CRIME X | \n")
        escreva(" |_____________________| \n\n")
        escreva("Voce chega a mansao Rosemont. O corpo do Sr. Aldric\n")
        escreva("Rosemont foi encontrado na biblioteca, caido perto\n")
        escreva("da lareira. A policia isolou o local e aguarda voce.\n\n")

        faca
        {
            escreva("\n--- O que deseja examinar? ---\n")
            escreva("1 - Manchas de sangue perto da lareira\n")
            escreva("2 - Um bilhete amassado sobre a mesa\n")
            escreva("3 - Conversar com a governanta (testemunha)\n")
            escreva("4 - Encerrar investigacao no local e seguir\n")
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
                        escreva("\nVoce ja examinou esse local.\n")
                    }
                pare
                caso 2:
                    se(pistaBilhete == falso)
                    {
                        escreva("\nO bilhete diz: 'Se voce contar, sera o proximo.'\n")
                        escreva("A letra parece feminina, escrita com tinta vermelha.\n")
                        pistaBilhete = verdadeiro
                    }
                    senao
                    {
                        escreva("\nVoce ja leu esse bilhete.\n")
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
                        escreva("\nEla nao tem mais nada a dizer.\n")
                    }
                pare
                caso 4:
                    escreva("\nVoce decide que ja tem informacoes suficientes.\n")
                pare
                caso contrario:
                    escreva("\nOpcao invalida.\n")
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

        escreva("\nVoce coletou ", totalPistas, " de 3 pistas nesta cena.\n")
        escreva("(Proxima etapa: interrogatorio dos suspeitos - em construcao)\n")
    }
}
