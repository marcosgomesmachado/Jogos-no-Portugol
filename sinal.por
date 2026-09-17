programa
{
    inclua biblioteca Util --> u
    inclua biblioteca Texto --> txt

    const inteiro VELOCIDADE_TEXTO = 20
    const inteiro TOTAL_FRAGMENTOS = 12
    const inteiro TOTAL_REGISTROS = 3

    cadeia fragmentos[TOTAL_FRAGMENTOS]
    cadeia fragmentosAlt[TOTAL_FRAGMENTOS]
    inteiro corrupcaoBase[TOTAL_FRAGMENTOS]
    inteiro corrupcao[TOTAL_FRAGMENTOS]
    inteiro tipoCorrupcao[TOTAL_FRAGMENTOS]
    logico fragmentoVisto[TOTAL_FRAGMENTOS]

    cadeia registros[TOTAL_REGISTROS]
    logico registroVisto[TOTAL_REGISTROS]

    inteiro energia = 40
    inteiro integridade = 100
    inteiro cicloAtual = 1
    inteiro reprocessamentosRestantes = 2

    logico antenaAmplificada = falso
    logico desligouAntena = falso
    logico confiouNoRegistro = falso
    logico preservouMensagem = falso
    logico nucleoAprimorado = falso
    logico emergenciaUsada = falso
    logico segurancaInvestigada = falso
    logico crisisJaOcorreu = falso
    logico registro2Perdido = falso

    funcao escrevaLenta(cadeia texto)
    {
        inteiro tamanho
        caracter letra

        tamanho = txt.numero_caracteres(texto)

        para(inteiro indice = 0; indice < tamanho; indice++)
        {
            letra = txt.obter_caracter(texto, indice)
            escreva(letra)
            u.aguarde(VELOCIDADE_TEXTO)
        }
    }

    funcao escrevaCorrompida(cadeia texto, inteiro nivelCorrupcao)
    {
        inteiro tamanho
        inteiro chance
        inteiro sorte
        inteiro indiceSimbolo
        caracter letra
        cadeia simbolos[5]

        simbolos[0] = "#"
        simbolos[1] = "%"
        simbolos[2] = "*"
        simbolos[3] = "@"
        simbolos[4] = "?"

        chance = nivelCorrupcao * 15
        tamanho = txt.numero_caracteres(texto)

        para(inteiro indice = 0; indice < tamanho; indice++)
        {
            letra = txt.obter_caracter(texto, indice)

            se(letra != ' ' e letra != '\n' e nivelCorrupcao > 0)
            {
                sorte = u.sorteia(1,100)

                se(sorte <= chance)
                {
                    indiceSimbolo = u.sorteia(0,4)
                    escreva(simbolos[indiceSimbolo])
                }
                senao
                {
                    escreva(letra)
                }
            }
            senao
            {
                escreva(letra)
            }

            u.aguarde(VELOCIDADE_TEXTO)
        }
    }

    funcao carregarDados()
    {
        fragmentos[0] = "Aqui é a Elysium. Estamos seguindo para as\ncoordenadas designadas, tudo em ordem.\nPróxima transmissão em 40 horas.\n"
        fragmentos[1] = "Detectamos uma anomalia no sistema de\nnavegação. Não é grave, provavelmente um\nerro de calibração.\n\nDiz pra minha filha que ainda vou chegar\na tempo do aniversário dela.\n"
        fragmentos[2] = "Registro de manutenção de rotina. O sistema\nexperimental continua em fase de testes.\nO capitão garante que só será usado em\numa emergência real.\n"
        fragmentos[3] = "Erro de navegação detectado. O capitão\nautorizou o uso do sistema experimental\npara corrigir a rota imediatamente.\n"
        fragmentos[4] = "Eu disse que era arriscado demais, mas ele\nachou que não tínhamos escolha.\n\nSe isso der errado, quero que fique\nregistrado que eu avisei.\n"
        fragmentos[5] = "O protocolo de correção falhou assim que\nfoi ativado. Perdemos o controle da rota\npor completo.\n"
        fragmentos[6] = "O sistema experimental não era só um\ncorretor de rota. Era um algoritmo que\ntestava trajetórias que ainda não haviam\nacontecido, escolhendo a melhor depois\nde ver o resultado.\n"
        fragmentos[7] = "Registro final do capitão.\nSe alguém receber isto, o erro não foi o\nsistema. O erro fomos nós, tentando\ncorrigir algo que não devíamos tocar.\n"
        fragmentos[8] = "Coordenadas: Setor 7, Grade 12-B, órbita\nbaixa. Data: impossível de confirmar - os\nsistemas indicam um momento muito próximo\ndo presente.\n"
        fragmentos[9] = "Alguém está tentando desligar a antena\nprincipal. Não sei se para nos proteger\nou para nos isolar de vez.\n"
        fragmentos[10] = "Não é a primeira vez que fazemos isso.\nJá ouvi essas mesmas palavras antes, mas\nnão consigo lembrar onde.\n"
        fragmentos[11] = "As coordenadas são as da Farol-9.\nA data é agora, ou daqui a poucas horas.\nO sinal que você recebeu pode ser o\nmesmo que você está prestes a enviar.\n"

        fragmentosAlt[5] = "O protocolo de correção funcionou como\nesperado. A rota foi corrigida sem\nproblemas.\n"
        fragmentosAlt[8] = "Coordenadas: [DADO OCULTO].\nData: [DADO OCULTO].\n"

        corrupcaoBase[0] = 0
        corrupcaoBase[1] = 2
        corrupcaoBase[2] = 1
        corrupcaoBase[3] = 2
        corrupcaoBase[4] = 2
        corrupcaoBase[5] = 3
        corrupcaoBase[6] = 2
        corrupcaoBase[7] = 2
        corrupcaoBase[8] = 3
        corrupcaoBase[9] = 2
        corrupcaoBase[10] = 3
        corrupcaoBase[11] = 2

        tipoCorrupcao[0] = 0
        tipoCorrupcao[1] = 0
        tipoCorrupcao[2] = 0
        tipoCorrupcao[3] = 0
        tipoCorrupcao[4] = 0
        tipoCorrupcao[5] = 2
        tipoCorrupcao[6] = 0
        tipoCorrupcao[7] = 0
        tipoCorrupcao[8] = 1
        tipoCorrupcao[9] = 0
        tipoCorrupcao[10] = 0
        tipoCorrupcao[11] = 0

        registros[0] = "Diagnóstico remoto automático, arquivado\nhá décadas: nenhuma falha de navegação\nfoi registrada na Elysium antes da perda\nde contato.\n"
        registros[1] = "Registro interno: falha no protocolo de\ncorreção detectada e catalogada quatro\nminutos antes do silêncio de rádio.\n"
        registros[2] = "Especificação técnica desta estação:\ncódigo orbital Farol-9 - Setor 7,\nGrade 12-B, órbita baixa.\n"

        para(inteiro i = 0; i < TOTAL_FRAGMENTOS; i++)
        {
            fragmentoVisto[i] = falso
        }

        para(inteiro i = 0; i < TOTAL_REGISTROS; i++)
        {
            registroVisto[i] = falso
        }
    }

    funcao sortearCorrupcaoInicial()
    {
        para(inteiro i = 0; i < TOTAL_FRAGMENTOS; i++)
        {
            corrupcao[i] = corrupcaoBase[i] + u.sorteia(0,1)

            se(corrupcao[i] > 3)
            {
                corrupcao[i] = 3
            }
        }
    }

    funcao exibirBarraEnergia()
    {
        inteiro barras

        barras = energia / 3

        escreva("Energia: [")

        para(inteiro i = 0; i < 14; i++)
        {
            se(i < barras)
            {
                escreva("#")
            }
            senao
            {
                escreva(".")
            }
        }

        escreva("] ", energia, "/40\n")
    }

    funcao exibirBarraIntegridade()
    {
        inteiro barras

        barras = integridade / 7

        escreva("Integridade: [")

        para(inteiro i = 0; i < 14; i++)
        {
            se(i < barras)
            {
                escreva("=")
            }
            senao
            {
                escreva(".")
            }
        }

        escreva("] ", integridade, "/100\n")
    }

    funcao inteiro custoLimpeza(inteiro nivelAtual)
    {
        inteiro custo

        se(nivelAtual == 3)
        {
            custo = 3
        }
        senao
        {
            se(nivelAtual == 2)
            {
                custo = 5
            }
            senao
            {
                se(nivelAtual == 1)
                {
                    custo = 8
                }
                senao
                {
                    custo = 0
                }
            }
        }

        se(nucleoAprimorado e custo > 0)
        {
            custo = custo - 2

            se(custo < 1)
            {
                custo = 1
            }
        }

        retorne custo
    }

    funcao logico limparFragmento(inteiro indice)
    {
        inteiro custo

        se(corrupcao[indice] <= 0)
        {
            escreva("\nEste fragmento já está totalmente legível.\n")
            retorne falso
        }

        custo = custoLimpeza(corrupcao[indice])

        se(energia < custo)
        {
            escreva("\nVocê não tem energia suficiente para isso.\n")
            retorne falso
        }

        energia = energia - custo
        corrupcao[indice] = corrupcao[indice] - 1

        escreva("\nSinal parcialmente limpo.\n")
        exibirBarraEnergia()

        retorne verdadeiro
    }

    funcao inteiro calcularClareza()
    {
        inteiro soma
        soma = 0

        para(inteiro i = 0; i < TOTAL_FRAGMENTOS; i++)
        {
            soma = soma + (3 - corrupcao[i])
        }

        retorne soma
    }

    funcao inteiro calcularCompreensao()
    {
        inteiro pontos
        pontos = 0

        se(fragmentoVisto[3] e registroVisto[0])
        {
            pontos = pontos + 1
        }

        se(fragmentoVisto[5] e registroVisto[1] e corrupcao[5] <= 1)
        {
            pontos = pontos + 1
        }

        se(fragmentoVisto[8] e registroVisto[2] e corrupcao[8] <= 1)
        {
            pontos = pontos + 1
        }

        retorne pontos
    }

    funcao inicio()
    {
        inteiro opcaoMenu

        carregarDados()
        exibirTitulo()

        faca
        {
            exibirMenuPrincipal()
            leia(opcaoMenu)

            escolha(opcaoMenu)
            {
                caso 1:
                    jogar()
                pare
                caso 2:
                    exibirInstrucoes()
                pare
                caso 3:
                    escrevaLenta("\nA transmissão termina aqui. Até a próxima.\n")
                pare
                caso contrario:
                    escreva("\nOpção inválida.\n")
                pare
            }
        }enquanto(opcaoMenu != 3)
    }

    funcao exibirTitulo()
    {
        escreva("=========================================\n")
        escreva("           >>> S I N A L <<<\n")
        escreva("       Estação de Escuta Farol-9\n")
        escreva("=========================================\n\n")
    }

    funcao exibirMenuPrincipal()
    {
        escreva("------------------------------\n")
        escreva("1 - Iniciar turno de escuta\n")
        escreva("2 - Instruções\n")
        escreva("3 - Sair\n")
        escreva("------------------------------\n")
        escreva("Escolha uma opção: ")
    }

    funcao exibirInstrucoes()
    {
        escreva("\n---------------------------------------------\n")

        escrevaLenta("Você é o operador da estação Farol-9,\nprestes a ser desativada. Um sinal fraco\ncomeçou a chegar - e ele está corrompido.\n\n")

        escrevaLenta("O JOGO FUNCIONA EM CICLOS\n")
        escrevaLenta("Você tem 15 ciclos até o desligamento. A\ncada ciclo, escolha UM setor da estação\npara visitar. Não dá pra visitar todos os\nsetores todo ciclo - escolha com cuidado.\n\n")

        escrevaLenta("OS SETORES\n")
        escrevaLenta("Central de Comunicações processa os\nfragmentos do sinal.\n")
        escrevaLenta("Arquivos guarda registros da própria\nestação, úteis para cruzar informações.\n")
        escrevaLenta("Sala de Energia e Manutenção ajudam a\nequilibrar seus recursos.\n")
        escrevaLenta("Antena, Núcleo e Segurança se abrem mais\ntarde, conforme o jogo avança.\n\n")

        escrevaLenta("SEUS RECURSOS\n")
        escrevaLenta("Energia é gasta para limpar fragmentos\ncorrompidos. Quanto mais limpo um\nfragmento já está, mais caro fica limpar\no próximo nível.\n")
        escrevaLenta("Integridade é a saúde da estação. Se cair\ndemais, algo ruim acontece.\n\n")

        escrevaLenta("A CORRUPÇÃO NÃO É SÓ VISUAL\n")
        escrevaLenta("Alguns fragmentos escondem dados críticos\ncomo coordenadas e datas até serem bem\nlimpos. Outros mudam de sentido conforme\nvocê limpa mais - a primeira leitura pode\nnão ser a verdadeira.\n\n")

        escrevaLenta("INVESTIGAÇÃO\n")
        escrevaLenta("Alguns registros dos Arquivos contradizem\nos fragmentos da nave. Preste atenção -\ncruzar essas informações é essencial para\nentender o que realmente aconteceu.\n\n")

        escrevaLenta("O FINAL\n")
        escrevaLenta("No fim dos 15 ciclos, você decide se vale\na pena retransmitir tudo o que descobriu.\nA clareza dos fragmentos e o quanto você\nrealmente entendeu vão decidir o que\nacontece a seguir.\n")

        escreva("---------------------------------------------\n\n")
    }

    funcao jogar()
    {
        sortearCorrupcaoInicial()

        escreva("\n\n=============================================\n")
        escreva("   FAROL-9 - ÚLTIMO TURNO DE ESCUTA\n")
        escreva("=============================================\n\n")

        escrevaLenta("Você está sozinho na estação Farol-9.\nDepois de anos sem resultado, a\ndesativação está marcada para o fim\ndeste turno.\n\n")
        escrevaLenta("Um sinal fraco começou a chegar, vindo de\numa nave chamada Elysium, desaparecida há\nmuito tempo.\n\n")
        escrevaLenta("Você tem 15 ciclos antes do desligamento.\nUse-os com cuidado.\n\n")

        enquanto(cicloAtual <= 15)
        {
            menuEstacao()
            atualizarEstado()
        }

        reconstrucaoFinal()
        decisaoFinal()

        escreva("\n\n=========== FIM DA TRANSMISSÃO ===========\n")
        escrevaLenta("Obrigado por jogar Sinal.\n")
    }

    funcao menuEstacao()
    {
        inteiro escolhaSetor

        escreva("\n\n=============================================\n")
        escreva("   FAROL-9 - CICLO ", cicloAtual, " DE 15\n")
        escreva("=============================================\n")
        exibirBarraEnergia()
        exibirBarraIntegridade()

        escreva("\n--- Setores disponíveis ---\n")
        escreva("1 - Central de Comunicações\n")
        escreva("2 - Sala de Energia\n")
        escreva("3 - Arquivos\n")
        escreva("4 - Manutenção\n")

        se(cicloAtual >= 4)
        {
            escreva("5 - Antena\n")
            escreva("6 - Núcleo de Processamento\n")
        }

        se(cicloAtual >= 7)
        {
            escreva("7 - Segurança\n")
        }

        se(cicloAtual >= 10)
        {
            escreva("8 - Terminal de Emergência\n")
        }

        escreva("Escolha: ")
        leia(escolhaSetor)

        escolha(escolhaSetor)
        {
            caso 1:
                processarSinal()
            pare
            caso 2:
                visitarEnergia()
            pare
            caso 3:
                visitarArquivos()
            pare
            caso 4:
                visitarManutencao()
            pare
            caso 5:
                se(cicloAtual >= 4)
                {
                    visitarAntena()
                }
                senao
                {
                    escreva("\nSetor ainda não disponível.\n")
                }
            pare
            caso 6:
                se(cicloAtual >= 4)
                {
                    visitarNucleo()
                }
                senao
                {
                    escreva("\nSetor ainda não disponível.\n")
                }
            pare
            caso 7:
                se(cicloAtual >= 7)
                {
                    visitarSeguranca()
                }
                senao
                {
                    escreva("\nSetor ainda não disponível.\n")
                }
            pare
            caso 8:
                se(cicloAtual >= 10)
                {
                    visitarEmergencia()
                }
                senao
                {
                    escreva("\nSetor ainda não disponível.\n")
                }
            pare
            caso contrario:
                escreva("\nOpção inválida.\n")
            pare
        }
    }

    funcao atualizarEstado()
    {
        cicloAtual = cicloAtual + 1
        integridade = integridade - 2

        se(integridade < 0)
        {
            integridade = 0
        }

        dispararEventos(cicloAtual)
    }

    funcao dispararEventos(inteiro ciclo)
    {
        se(ciclo == 4)
        {
            escreva("\n\n!!! EVENTO !!!\n")
            escrevaLenta("Uma queda de energia inesperada atinge a\nestação. Você perde parte da sua reserva.\n")
            energia = energia - 5

            se(energia < 0)
            {
                energia = 0
            }
        }

        se(integridade < 30 e crisisJaOcorreu == falso)
        {
            crisisJaOcorreu = verdadeiro
            eventoCrise()
        }

        se(ciclo == 7 e desligouAntena == falso)
        {
            escreva("\n\n!!! EVENTO !!!\n")
            escrevaLenta("Por um instante, a antena capta algo que\nnão deveria existir: uma transmissão fora\nde ordem, com a sua própria voz.\n")
        }

        se(ciclo == 10 e registroVisto[2] == falso e registro2Perdido == falso)
        {
            registro2Perdido = verdadeiro
            escreva("\n\n!!! EVENTO !!!\n")
            escrevaLenta("Um registro importante se corrompeu\nirreversivelmente. Você não vai mais\nconseguir acessá-lo.\n")
        }
    }

    funcao eventoCrise()
    {
        inteiro escolhaCrise

        escreva("\n\n!!! ALERTA !!!\n")
        escrevaLenta("Falha estrutural detectada. Você precisa\nagir rápido.\n")
        escreva("1 - Redirecionar energia de emergência\n")
        escreva("    para os reparos (-10 energia,\n")
        escreva("    +20 integridade)\n")
        escreva("2 - Ignorar e continuar\n")
        escreva("Escolha: ")
        leia(escolhaCrise)

        se(escolhaCrise == 1 e energia >= 10)
        {
            energia = energia - 10
            integridade = integridade + 20

            se(integridade > 100)
            {
                integridade = 100
            }

            escreva("\nReparos concluídos.\n")
        }
        senao
        {
            escreva("\nVocê decide arriscar e seguir em frente.\n")
        }
    }

    funcao exibirFragmento(inteiro indice)
    {
        escreva("\n[Nível de corrupção: ", corrupcao[indice], "/3]\n\n")

        se(tipoCorrupcao[indice] == 0)
        {
            escrevaCorrompida(fragmentos[indice], corrupcao[indice])
        }
        senao
        {
            se(corrupcao[indice] <= 1)
            {
                escrevaCorrompida(fragmentos[indice], corrupcao[indice])
            }
            senao
            {
                escrevaCorrompida(fragmentosAlt[indice], corrupcao[indice])
            }
        }

        fragmentoVisto[indice] = verdadeiro
    }

    funcao processarSinal()
    {
        inteiro escolhaFragmento
        inteiro maximoDisponivel

        maximoDisponivel = 3

        se(cicloAtual >= 4)
        {
            maximoDisponivel = 6
        }

        se(cicloAtual >= 7)
        {
            maximoDisponivel = 8
        }

        se(cicloAtual >= 10)
        {
            maximoDisponivel = 11
        }

        se(cicloAtual >= 13)
        {
            maximoDisponivel = 12
        }

        escreva("\n\n--- CENTRAL DE COMUNICAÇÕES ---\n")
        escreva("Fragmentos disponíveis (1 a ", maximoDisponivel, ")\n")
        escreva("Escolha um fragmento para processar,\n")
        escreva("ou 0 para voltar.\n")
        escreva("Escolha: ")
        leia(escolhaFragmento)

        se(escolhaFragmento >= 1 e escolhaFragmento <= maximoDisponivel)
        {
            processarUmFragmento(escolhaFragmento - 1)
        }
        senao
        {
            se(escolhaFragmento != 0)
            {
                escreva("\nFragmento indisponível.\n")
            }
        }
    }

    funcao processarUmFragmento(inteiro indice)
    {
        inteiro escolhaTurno
        logico sair

        sair = falso

        faca
        {
            exibirFragmento(indice)

            se(indice == 9)
            {
                se(desligouAntena)
                {
                    escrevaLenta("\n(Você lembra: foi você quem desligou\na antena. Era tarde demais.)\n")
                }
                senao
                {
                    escrevaLenta("\n(Você lembra: decidiu manter a antena\nligada, mesmo sabendo o risco.)\n")
                }
            }

            escreva("\n--- O que deseja fazer? ---\n")
            escreva("1 - Tentar limpar mais este fragmento\n")
            escreva("2 - Voltar\n")
            escreva("Escolha: ")
            leia(escolhaTurno)

            escolha(escolhaTurno)
            {
                caso 1:
                    limparFragmento(indice)
                pare
                caso 2:
                    sair = verdadeiro
                pare
                caso contrario:
                    escreva("\nOpção inválida.\n")
                pare
            }
        }enquanto(sair == falso)
    }

    funcao visitarArquivos()
    {
        inteiro escolhaArquivo
        inteiro escolhaConfianca

        escreva("\n\n--- ARQUIVOS ---\n")
        escreva("Registros disponíveis:\n")

        se(cicloAtual >= 4)
        {
            escreva("1 - Diagnóstico remoto antigo\n")
        }

        se(cicloAtual >= 7)
        {
            escreva("2 - Registro interno de falha\n")
        }

        se(cicloAtual >= 7 e registro2Perdido == falso)
        {
            escreva("3 - Especificação técnica da estação\n")
        }

        escreva("4 - Voltar\n")
        escreva("Escolha: ")
        leia(escolhaArquivo)

        escolha(escolhaArquivo)
        {
            caso 1:
                se(cicloAtual >= 4)
                {
                    escreva("\n")
                    escrevaLenta(registros[0])
                    registroVisto[0] = verdadeiro
                }
                senao
                {
                    escreva("\nRegistro ainda não disponível.\n")
                }
            pare
            caso 2:
                se(cicloAtual >= 7)
                {
                    escreva("\n")
                    escrevaLenta(registros[1])

                    se(registroVisto[1] == falso)
                    {
                        registroVisto[1] = verdadeiro

                        escreva("\nVocê confia neste registro?\n")
                        escreva("1 - Sim, confio\n")
                        escreva("2 - Não, quero investigar mais\n")
                        escreva("Escolha: ")
                        leia(escolhaConfianca)

                        se(escolhaConfianca == 1)
                        {
                            confiouNoRegistro = verdadeiro
                        }
                        senao
                        {
                            confiouNoRegistro = falso
                        }
                    }
                }
                senao
                {
                    escreva("\nRegistro indisponível.\n")
                }
            pare
            caso 3:
                se(cicloAtual >= 7 e registro2Perdido == falso)
                {
                    escreva("\n")
                    escrevaLenta(registros[2])
                    registroVisto[2] = verdadeiro
                }
                senao
                {
                    escreva("\nRegistro indisponível.\n")
                }
            pare
            caso 4:
                escreva("\nVocê volta ao corredor principal.\n")
            pare
            caso contrario:
                escreva("\nOpção inválida.\n")
            pare
        }
    }

    funcao visitarAntena()
    {
        inteiro escolhaAntena

        escreva("\n\n--- ANTENA ---\n")
        escreva("1 - Amplificar sinal (-6 energia)\n")
        escreva("2 - Desligar a antena principal\n")
        escreva("3 - Deixar como está\n")
        escreva("Escolha: ")
        leia(escolhaAntena)

        escolha(escolhaAntena)
        {
            caso 1:
                se(energia >= 6)
                {
                    energia = energia - 6
                    antenaAmplificada = verdadeiro
                    escreva("\nSinal amplificado.\n")
                }
                senao
                {
                    escreva("\nEnergia insuficiente.\n")
                }
            pare
            caso 2:
                desligouAntena = verdadeiro
                escreva("\nVocê desliga a antena principal.\n")
            pare
            caso 3:
                escreva("\nVocê deixa a antena como está.\n")
            pare
            caso contrario:
                escreva("\nOpção inválida.\n")
            pare
        }
    }

    funcao visitarNucleo()
    {
        inteiro escolhaNucleo

        se(nucleoAprimorado == falso)
        {
            escreva("\n\n--- NÚCLEO DE PROCESSAMENTO ---\n")
            escreva("Investir energia aqui reduz o custo de\n")
            escreva("limpar fragmentos pelo resto do jogo.\n")
            escreva("Custo: 8 de energia.\n")
            escreva("1 - Investir\n")
            escreva("2 - Voltar\n")
            escreva("Escolha: ")
            leia(escolhaNucleo)

            se(escolhaNucleo == 1 e energia >= 8)
            {
                energia = energia - 8
                nucleoAprimorado = verdadeiro
                escreva("\nProcessamento aprimorado.\n")
            }
            senao
            {
                se(escolhaNucleo == 1)
                {
                    escreva("\nEnergia insuficiente.\n")
                }
                senao
                {
                    escreva("\nVocê volta ao corredor principal.\n")
                }
            }
        }
        senao
        {
            escreva("\nO núcleo já foi aprimorado.\n")
        }
    }

    funcao visitarEnergia()
    {
        inteiro escolhaEnergia

        escreva("\n\n--- SALA DE ENERGIA ---\n")
        escreva("1 - Redistribuir (-10 integridade,\n")
        escreva("    +10 energia)\n")
        escreva("2 - Estabilizar (-5 energia,\n")
        escreva("    +5 integridade)\n")
        escreva("3 - Voltar\n")
        escreva("Escolha: ")
        leia(escolhaEnergia)

        escolha(escolhaEnergia)
        {
            caso 1:
                se(integridade >= 10)
                {
                    integridade = integridade - 10
                    energia = energia + 10
                    escreva("\nEnergia redistribuída.\n")
                }
                senao
                {
                    escreva("\nIntegridade insuficiente para isso.\n")
                }
            pare
            caso 2:
                se(energia >= 5)
                {
                    energia = energia - 5
                    integridade = integridade + 5

                    se(integridade > 100)
                    {
                        integridade = 100
                    }

                    escreva("\nSistema estabilizado.\n")
                }
                senao
                {
                    escreva("\nEnergia insuficiente.\n")
                }
            pare
            caso 3:
                escreva("\nVocê volta ao corredor principal.\n")
            pare
            caso contrario:
                escreva("\nOpção inválida.\n")
            pare
        }
    }

    funcao visitarManutencao()
    {
        inteiro escolhaManutencao

        escreva("\n\n--- MANUTENÇÃO ---\n")
        escreva("1 - Reparar a estrutura (-5 energia,\n")
        escreva("    +15 integridade)\n")
        escreva("2 - Voltar\n")
        escreva("Escolha: ")
        leia(escolhaManutencao)

        se(escolhaManutencao == 1 e energia >= 5)
        {
            energia = energia - 5
            integridade = integridade + 15

            se(integridade > 100)
            {
                integridade = 100
            }

            escreva("\nReparo concluído.\n")
        }
        senao
        {
            se(escolhaManutencao == 1)
            {
                escreva("\nEnergia insuficiente.\n")
            }
            senao
            {
                escreva("\nVocê volta ao corredor principal.\n")
            }
        }
    }

    funcao visitarSeguranca()
    {
        se(segurancaInvestigada == falso)
        {
            segurancaInvestigada = verdadeiro

            escreva("\n\n--- SEGURANÇA ---\n")
            escrevaLenta("Você investiga os alertas do sistema de\nsegurança. A maioria é ruído, mas um\nregistro chama atenção: alguém tentou\nacessar este terminal antes de você,\nusando as suas próprias credenciais.\n")

            integridade = integridade + 5

            se(integridade > 100)
            {
                integridade = 100
            }

            escreva("\n(Integridade +5)\n")
        }
        senao
        {
            escreva("\nNão há novos alertas de segurança.\n")
        }
    }

    funcao visitarEmergencia()
    {
        inteiro escolhaMsg

        se(emergenciaUsada == falso)
        {
            emergenciaUsada = verdadeiro

            escreva("\n\n=============================================\n")
            escreva("   TERMINAL DE EMERGÊNCIA\n")
            escreva("=============================================\n")
            escrevaLenta("Um arquivo aparece do nada, sem remetente\nidentificável. O texto parece ter sido\nescrito com as suas próprias palavras.\n\n")
            escrevaLenta("Se você está lendo isto, pare de tentar\ncorrigir o passado e decida o que fazer\ncom o presente.\n\n")
            escreva("Deseja preservar esta mensagem ou apagá-la?\n")
            escreva("1 - Preservar\n")
            escreva("2 - Apagar\n")
            escreva("Escolha: ")
            leia(escolhaMsg)

            se(escolhaMsg == 1)
            {
                preservouMensagem = verdadeiro
                escreva("\nVocê guarda a mensagem.\n")
            }
            senao
            {
                preservouMensagem = falso
                escreva("\nVocê apaga a mensagem.\n")
            }
        }
        senao
        {
            escreva("\nO terminal está silencioso agora.\n")
        }
    }

    funcao reconstrucaoFinal()
    {
        inteiro escolhaReconstrucao
        inteiro indiceEscolhido
        inteiro compreensaoAtual

        escreva("\n\n=============================================\n")
        escreva("      RECONSTRUÇÃO DO SINAL\n")
        escreva("=============================================\n")
        escrevaLenta("Antes de decidir o que fazer, você revisa\ntudo o que conseguiu captar até agora.\n")

        faca
        {
            compreensaoAtual = calcularCompreensao()

            escreva("\n--- O que deseja fazer? ---\n")
            escreva("1 - Reler um fragmento já recebido\n")
            escreva("2 - Usar um reprocessamento (restantes: ", reprocessamentosRestantes, ")\n")

            se(preservouMensagem e compreensaoAtual == 3)
            {
                escreva("3 - ??? Sinal 13\n")
            }

            escreva("4 - Seguir para a decisão final\n")
            escreva("Escolha: ")
            leia(escolhaReconstrucao)

            escolha(escolhaReconstrucao)
            {
                caso 1:
                    escreva("\nQual fragmento (1 a ", TOTAL_FRAGMENTOS, ")? ")
                    leia(indiceEscolhido)

                    se(indiceEscolhido >= 1 e indiceEscolhido <= TOTAL_FRAGMENTOS)
                    {
                        exibirFragmento(indiceEscolhido - 1)
                    }
                    senao
                    {
                        escreva("\nFragmento inválido.\n")
                    }
                pare
                caso 2:
                    se(reprocessamentosRestantes > 0)
                    {
                        escreva("\nQual fragmento reprocessar (1 a ", TOTAL_FRAGMENTOS, ")? ")
                        leia(indiceEscolhido)

                        se(indiceEscolhido >= 1 e indiceEscolhido <= TOTAL_FRAGMENTOS)
                        {
                            se(limparFragmento(indiceEscolhido - 1))
                            {
                                reprocessamentosRestantes = reprocessamentosRestantes - 1
                            }
                        }
                        senao
                        {
                            escreva("\nFragmento inválido.\n")
                        }
                    }
                    senao
                    {
                        escreva("\nSem reprocessamentos disponíveis.\n")
                    }
                pare
                caso 3:
                    se(preservouMensagem e compreensaoAtual == 3)
                    {
                        escreva("\n")
                        escrevaLenta("Fragmento 13 - não deveria existir.\n\n")
                        escrevaLenta("Se você está lendo isso, significa que\njá fez tudo isso antes. E vai fazer de\nnovo. A pergunta nunca foi se você pode\nevitar o que aconteceu com a Elysium.\nA pergunta é se, desta vez, você vai\nfazer diferente.\n")
                    }
                    senao
                    {
                        escreva("\nOpção inválida.\n")
                    }
                pare
                caso 4:
                    escreva("\nVocê decide que é hora de agir.\n")
                pare
                caso contrario:
                    escreva("\nOpção inválida.\n")
                pare
            }
        }enquanto(escolhaReconstrucao != 4)
    }

    funcao decisaoFinal()
    {
        inteiro clareza
        inteiro compreensao
        inteiro escolhas
        logico retransmitiu

        clareza = calcularClareza()
        compreensao = calcularCompreensao()

        escreva("\n\n=============================================\n")
        escreva("      A ÚLTIMA TRANSMISSÃO\n")
        escreva("=============================================\n")
        escrevaLenta("A estação está prestes a desligar. Você\ntem energia suficiente para uma última\ndecisão.\n\n")

        exibirBarraEnergia()
        exibirBarraIntegridade()
        escreva("Clareza: ", clareza, "/36\n")
        escreva("Compreensão: ", compreensao, "/3\n")

        escreva("\n1 - Retransmitir o aviso\n")
        escreva("2 - Preservar a estação e não\n")
        escreva("    retransmitir\n")
        escreva("Escolha: ")
        leia(escolhas)

        se(escolhas == 1)
        {
            retransmitiu = verdadeiro
        }
        senao
        {
            retransmitiu = falso
        }

        se(retransmitiu == falso)
        {
            finalSilencio()
        }
        senao
        {
            se(clareza >= 24 e compreensao >= 2)
            {
                finalSinalCompleto()
            }
            senao
            {
                se(clareza >= 12)
                {
                    finalEcoDistorcido()
                }
                senao
                {
                    finalSilencio()
                }
            }
        }
    }

    funcao finalSinalCompleto()
    {
        escreva("\n\n########## FINAL: SINAL COMPLETO ##########\n")
        escrevaLenta("O aviso sai claro, cada palavra no lugar\ncerto. Do outro lado do tempo, alguém -\nvocê mesmo, talvez - vai ouvir exatamente\no que precisa ouvir.\n")

        se(confiouNoRegistro)
        {
            escrevaLenta("\nVocê confiou nos registros da estação, e\neles não mentiram. Há um alívio estranho\nem saber que a verdade estava sempre ali,\nesperando ser lida com atenção.\n")
        }
        senao
        {
            escrevaLenta("\nVocê não confiou em nada que não pôde\nconfirmar sozinho. Foi mais difícil, mas\na verdade que você reconstruiu é\ninteiramente sua.\n")
        }

        escrevaLenta("\nNão há garantia de que o desastre será\nevitado. Mas, pela primeira vez, alguém\nvai enfrentá-lo sabendo a verdade inteira.\n")
        escreva("#############################################\n")
    }

    funcao finalEcoDistorcido()
    {
        escreva("\n\n########## FINAL: ECO DISTORCIDO ##########\n")
        escrevaLenta("O aviso sai, mas fragmentado - as mesmas\nlacunas que você teve que enfrentar agora\npassam adiante.\n")

        se(desligouAntena)
        {
            escrevaLenta("\nVocê desligou a antena a tempo, ao menos\numa vez. Talvez isso baste para quebrar\nalguma coisa, em algum lugar.\n")
        }
        senao
        {
            escrevaLenta("\nA antena ficou ligada até o fim, como da\núltima vez. Você não sabe se isso ajuda\nou condena quem vai receber o sinal.\n")
        }

        escreva("#############################################\n")
    }

    funcao finalSilencio()
    {
        escreva("\n\n########## FINAL: SILÊNCIO ##########\n")
        escrevaLenta("A estação desliga. Nenhum aviso sai. O\nsinal que você recebeu - e que talvez\ntenha sido enviado por você mesmo, em\noutro momento - permanece sem resposta.\nEm algum lugar, o ciclo continua\nexatamente como sempre foi.\n")
        escreva("#############################################\n")
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 34292; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */