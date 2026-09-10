programa
{
    inclua biblioteca Util --> u
    inclua biblioteca Texto --> txt

    // ================================================
    // CONSTANTE DE CONTROLE DE TEMPO
    // ================================================
    const inteiro VELOCIDADE_TEXTO = 40

    // ================================================
    // VARIAVEIS GLOBAIS DO JOGO (ja inicializadas)
    // ================================================
    logico pistaSangue = falso
    logico pistaBilhete = falso
    logico pistaTestemunha = falso
    logico quadroNotado = falso
    logico cofreAberto = falso
    logico documentoEncontrado = falso

    logico falouGovernanta = falso
    logico falouBeatriz = falso
    logico falouRenato = falso

    logico contradicaoRenato = falso
    logico contradicaoBeatriz = falso
    logico contradicaoPorta = falso

    logico visitouEstante = falso
    logico visitouJanela = falso

    inteiro totalPistas = 0
    inteiro pontosDeducao = 0

    // ================================================
    // EFEITO DE DIGITACAO (TYPEWRITER)
    // ================================================
    funcao vazio escrevaLenta(cadeia texto)
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

    // ================================================
    // MENU PRINCIPAL
    // ================================================
    funcao inicio()
    {
        inteiro opcaoMenu

        exibirTitulo()

        faca
        {
            exibirMenuPrincipal()
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
                    escrevaLenta("\nVocê guarda seu caderno de anotações. Até a próxima, detetive.\n")
                pare
                caso contrario:
                    escreva("\nOpção inválida. Tente novamente.\n")
                pare
            }
        }enquanto(opcaoMenu != 3)
    }

    funcao exibirTitulo()
    {
        escreva("=========================================\n")
        escreva("        ARQUIVO 13 - CASOS OCULTOS\n")
        escreva("=========================================\n\n")
    }

    funcao exibirMenuPrincipal()
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
        escreva("\n---------------------------------------------\n")
        escrevaLenta("Você é um detetive particular chamado para investigar um crime que a polícia local não conseguiu resolver sozinha.\n\n")
        escrevaLenta("Explore a cena do crime, converse com os suspeitos, cruze as informações e descubra quem é o verdadeiro culpado antes de fazer sua acusação final.\n\n")
        escrevaLenta("Digite o número da opção desejada e pressione ENTER para confirmar.\n")
        escreva("---------------------------------------------\n\n")
    }

    // ================================================
    // FUNCAO PRINCIPAL DO CASO
    // ================================================
    funcao iniciarJogo()
    {
        escreva("\n\n===============================================\n")
        escreva("   CASO 1: A MORTE DO SR. ALDRIC ROSEMONT\n")
        escreva("===============================================\n\n")

        escrevaLenta("Você chega à mansão Rosemont pouco depois da meia-noite. O corpo do empresário Aldric Rosemont foi encontrado na biblioteca da casa, caído perto da lareira. Um policial o aguarda na entrada.\n\n")
        escrevaLenta("Três pessoas estavam na propriedade naquela noite: a governanta, que trabalha na casa há décadas; Beatriz, sobrinha e única herdeira de Aldric; e Renato, sócio e amigo de longa data de Aldric.\n\n")

        cenaDoCrime()
        interrogatoriosDia1()
        segundoDia()
        quadroDeDeducao()
        confrontoFinal()

        escreva("\n\n=========== FIM DO CASO ===========\n")
        escrevaLenta("Obrigado por jogar Arquivo 13 - Casos Ocultos!\n")
    }

    // ================================================
    // CENA DO CRIME
    // ================================================
    funcao cenaDoCrime()
    {
        inteiro escolhaCena
        caracter investigarMais
        caracter pegarPapel

        escreva("\n  _____________________ \n")
        escreva(" |  CENA DO CRIME       | \n")
        escreva(" |_____________________| \n\n")

        faca
        {
            escreva("\n--- O que deseja examinar? ---\n")
            escreva("1 - Manchas de sangue perto da lareira\n")
            escreva("2 - Um bilhete amassado sobre a mesa\n")
            escreva("3 - Conversar rapidamente com a governanta\n")
            escreva("4 - Examinar a estante de livros\n")
            escreva("5 - Examinar a janela da biblioteca\n")
            escreva("6 - Encerrar exame da cena e seguir\n")
            escreva("Escolha: ")
            leia(escolhaCena)

            escolha(escolhaCena)
            {
                caso 1:
                    se(pistaSangue == falso)
                    {
                        escrevaLenta("As manchas indicam que o corpo foi arrastado cerca de dois metros antes de parar perto da lareira. Você também nota que um dos quadros na parede está levemente torto.\n")

                        quadroNotado = verdadeiro

                        escreva("\nQuer investigar o quadro torto? [s/n]: ")
                        leia(investigarMais)

                        se(investigarMais == 's')
                        {
                            escrevaLenta("\nAo se aproximar, você encosta no quadro sem querer e ele cai, revelando um pequeno compartimento secreto na parede. Dentro dele há uma folha de papel dobrada.\n")
                            escreva("Quer pegar o papel? [s/n]: ")
                            leia(pegarPapel)

                            se(pegarPapel == 's')
                            {
                                cofreAberto = verdadeiro
                                documentoEncontrado = verdadeiro
                                escrevaLenta("\nVocê abre o papel: é uma certidão de nascimento antiga, rasgada exatamente na parte onde deveria constar o nome do pai. Só é possível ler o nome da mãe da criança, uma mulher chamada Marta Ferreira. Você guarda o documento com cuidado.\n")
                            }
                            senao
                            {
                                escrevaLenta("\nVocê decide não mexer no papel e fecha o compartimento novamente.\n")
                            }
                        }
                        senao
                        {
                            escrevaLenta("\nVocê anota o detalhe do quadro torto, mas decide não se aprofundar agora.\n")
                        }

                        pistaSangue = verdadeiro
                    }
                    senao
                    {
                        escreva("\nVocê já examinou esse local.\n")
                    }
                pare
                caso 2:
                    se(pistaBilhete == falso)
                    {
                        escrevaLenta("\nO bilhete diz: 'Se você contar, será o próximo.' A letra parece feminina, escrita às pressas com tinta vermelha.\n")
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
                        escrevaLenta("\nA governanta diz, nervosa: 'Eu estava na cozinha quando ouvi gritos, por volta das 22h. Corri para cá, mas a porta estava trancada por fora.'\n")
                        pistaTestemunha = verdadeiro
                    }
                    senao
                    {
                        escreva("\nEla não tem mais nada a dizer agora.\n")
                    }
                pare
                caso 4:
                    se(visitouEstante == falso)
                    {
                        escrevaLenta("\nEntre os livros, um álbum de fotos antigas da família Rosemont chama atenção. Você folheia rapidamente, mas não reconhece ninguém além do próprio Aldric quando jovem.\n")
                        visitouEstante = verdadeiro
                    }
                    senao
                    {
                        escreva("\nVocê já viu o álbum de fotos.\n")
                    }
                pare
                caso 5:
                    se(visitouJanela == falso)
                    {
                        escrevaLenta("\nA janela está fechada por dentro, sem sinais de arrombamento. Quem entrou na biblioteca, entrou pela porta.\n")
                        visitouJanela = verdadeiro
                    }
                    senao
                    {
                        escreva("\nA janela continua trancada por dentro.\n")
                    }
                pare
                caso 6:
                    escreva("\nVocê decide que já tem informações suficientes por aqui.\n")
                pare
                caso contrario:
                    escreva("\nOpção inválida.\n")
                pare
            }
        }enquanto(escolhaCena != 6)

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

        escreva("\nVocê coletou ", totalPistas, " de 3 pistas principais nesta cena.\n")
    }

    // ================================================
    // RODADA DE INTERROGATORIOS - DIA 1
    // ================================================
    funcao interrogatoriosDia1()
    {
        inteiro escolhaSuspeito

        escreva("\n\n===============================================\n")
        escreva("      RODADA DE INTERROGATÓRIOS\n")
        escreva("===============================================\n")
        escrevaLenta("Você reúne os três suspeitos na sala de estar para conversar com cada um, na ordem que quiser.\n")

        faca
        {
            escreva("\n--- Com quem deseja falar? ---\n")
            escreva("1 - A governanta\n")
            escreva("2 - Beatriz (sobrinha)\n")
            escreva("3 - Renato (sócio)\n")
            escreva("4 - Encerrar esta rodada de interrogatórios\n")
            escreva("Escolha: ")
            leia(escolhaSuspeito)

            escolha(escolhaSuspeito)
            {
                caso 1:
                    falouGovernanta = verdadeiro
                    interrogarGovernanta()
                pare
                caso 2:
                    falouBeatriz = verdadeiro
                    interrogarBeatriz()
                pare
                caso 3:
                    falouRenato = verdadeiro
                    interrogarRenato()
                pare
                caso 4:
                    escreva("\nVocê decide encerrar esta rodada por agora.\n")
                pare
                caso contrario:
                    escreva("\nOpção inválida.\n")
                pare
            }
        }enquanto(escolhaSuspeito != 4)
    }

    funcao interrogarGovernanta()
    {
        inteiro pergunta

        escreva("\n-----------------------------------------\n")
        escrevaLenta("Você senta com a governanta na cozinha. Ela parece nervosa, mas cooperativa.\n")
        escreva("-----------------------------------------\n")

        faca
        {
            escreva("\nO que deseja perguntar?\n")
            escreva("1 - O que exatamente você viu e ouviu?\n")
            escreva("2 - Qual era sua relação com o Sr. Aldric?\n")
            escreva("3 - Havia outros visitantes naquela noite?\n")
            escreva("4 - O que sabe sobre o bilhete na mesa?\n")
            escreva("5 - Encerrar esta conversa\n")
            escreva("Escolha: ")
            leia(pergunta)

            escolha(pergunta)
            {
                caso 1:
                    escrevaLenta("\n'Eu estava terminando o serviço na cozinha quando ouvi gritos vindos da biblioteca, lá pelas 22h. Corri para cá, mas a porta estava trancada por fora. Quando finalmente consegui abrir, encontrei... aquilo.'\n")
                pare
                caso 2:
                    escrevaLenta("\nEla hesita por um instante antes de responder, olhando para o chão. 'Eu trabalho nesta casa há quase trinta anos. Ele... sempre foi um bom patrão para mim.'\n")
                pare
                caso 3:
                    escrevaLenta("\n'O senhor Renato? Ah, sim, ele ficou até mais tarde do que eu imaginava. Ouvi o carro dele saindo lá pelas 21h30.'\n")
                    contradicaoRenato = verdadeiro
                pare
                caso 4:
                    escrevaLenta("\nEla parece desconfortável com a pergunta. 'Não sei do que se trata. Talvez fosse algum aviso sobre segurança, não faço ideia.'\n")
                pare
                caso 5:
                    escreva("\nVocê agradece e encerra a conversa por ora.\n")
                pare
                caso contrario:
                    escreva("\nOpção inválida.\n")
                pare
            }
        }enquanto(pergunta != 5)
    }

    funcao interrogarBeatriz()
    {
        inteiro pergunta

        escreva("\n-----------------------------------------\n")
        escrevaLenta("Beatriz está sentada na sala, os olhos vermelhos de choro, mas atenta a cada pergunta que você faz.\n")
        escreva("-----------------------------------------\n")

        faca
        {
            escreva("\nO que deseja perguntar?\n")
            escreva("1 - Onde você estava na noite do crime?\n")
            escreva("2 - Qual era sua relação com o Sr. Aldric?\n")
            escreva("3 - O que acontece com a herança agora?\n")
            escreva("4 - Perguntar sobre a biblioteca\n")
            escreva("5 - Encerrar esta conversa\n")
            escreva("Escolha: ")
            leia(pergunta)

            escolha(pergunta)
            {
                caso 1:
                    escrevaLenta("\n'Eu cheguei à mansão só às 23h30, direto do aeroporto, assim que recebi a notícia. Antes disso eu estava viajando a trabalho.'\n")
                pare
                caso 2:
                    escrevaLenta("\n'Ele era o único parente que me restava. Meus pais morreram quando eu era criança e ele me criou, à distância. Nunca fomos realmente próximos, se estou sendo sincera.'\n")
                pare
                caso 3:
                    escrevaLenta("\nBeatriz desvia o olhar. 'Eu preciso dessa herança. Meu negócio está quebrado há meses, mas isso não significa que eu fiz alguma coisa.'\n")
                pare
                caso 4:
                    escrevaLenta("\n'Estranho... mais cedo naquele dia, quando passei pela biblioteca, notei que a chave estava do lado de dentro da porta. Não sei se isso importa.'\n")
                    contradicaoPorta = verdadeiro
                pare
                caso 5:
                    escreva("\nVocê agradece e encerra a conversa por ora.\n")
                pare
                caso contrario:
                    escreva("\nOpção inválida.\n")
                pare
            }
        }enquanto(pergunta != 5)
    }

    funcao interrogarRenato()
    {
        inteiro pergunta
        inteiro versaoMemoria

        escreva("\n-----------------------------------------\n")
        escrevaLenta("Renato o recebe em seu escritório, com um copo de whisky na mão. Parece cansado.\n")
        escreva("-----------------------------------------\n")

        faca
        {
            escreva("\nO que deseja perguntar?\n")
            escreva("1 - Onde você estava na noite do crime?\n")
            escreva("2 - Qual era sua relação com o Sr. Aldric?\n")
            escreva("3 - O que acha que aconteceu?\n")
            escreva("4 - Perguntar sobre a discussão recente\n")
            escreva("5 - Encerrar esta conversa\n")
            escreva("Escolha: ")
            leia(pergunta)

            escolha(pergunta)
            {
                caso 1:
                    escrevaLenta("\n'Saí da mansão por volta das 20h e fui direto para um jantar com investidores estrangeiros, para tratar da expansão internacional dos negócios.'\n")
                pare
                caso 2:
                    escrevaLenta("\n'Éramos sócios há quinze anos, praticamente irmãos... mas ultimamente as coisas andavam tensas. Ele era conservador demais, não queria arriscar expandir para fora do país.'\n")
                pare
                caso 3:
                    escrevaLenta("\n'Se quer saber minha opinião, olhe para a sobrinha dele. Vi o carro dela já estacionado no portão quando eu estava saindo, por volta das 21h30. Achei estranho ela não ter mencionado isso.'\n")
                    contradicaoBeatriz = verdadeiro
                pare
                caso 4:
                    versaoMemoria = u.sorteia(1,3)
                    escreva("\nRenato suspira antes de responder.\n")
                    se(versaoMemoria == 1)
                    {
                        escrevaLenta("'Ele disse que preferia falir a trair os valores da família. Na hora achei exagero.'\n")
                    }
                    se(versaoMemoria == 2)
                    {
                        escrevaLenta("'Ele gritou que eu só pensava em dinheiro, que eu não entendia o que realmente importava para ele.'\n")
                    }
                    se(versaoMemoria == 3)
                    {
                        escrevaLenta("'Ele disse algo estranho, tipo: tenho responsabilidades que você nem imagina. Na hora não dei importância.'\n")
                    }
                pare
                caso 5:
                    escreva("\nVocê agradece e encerra a conversa por ora.\n")
                pare
                caso contrario:
                    escreva("\nOpção inválida.\n")
                pare
            }
        }enquanto(pergunta != 5)
    }

    // ================================================
    // DIA 2 - CONFRONTOS COM AS CONTRADICOES
    // ================================================
    funcao segundoDia()
    {
        inteiro escolhaDia2

        escreva("\n\n===============================================\n")
        escreva("      UM NOVO DIA DE INVESTIGAÇÃO\n")
        escreva("===============================================\n")
        escrevaLenta("Na manhã seguinte, você revisa suas anotações. Alguns detalhes não batem. É hora de confrontar os suspeitos com o que você descobriu.\n")

        faca
        {
            escreva("\n--- O que deseja fazer? ---\n")
            escreva("1 - Confrontar Renato sobre o horário real\n")
            escreva("2 - Confrontar Beatriz sobre a chegada antecipada\n")
            escreva("3 - Confrontar a governanta sobre a porta trancada\n")
            escreva("4 - Encerrar a investigação e partir para as conclusões\n")
            escreva("Escolha: ")
            leia(escolhaDia2)

            escolha(escolhaDia2)
            {
                caso 1:
                    se(contradicaoRenato == verdadeiro)
                    {
                        escrevaLenta("\nRenato fica pálido ao ser confrontado. 'Tudo bem, eu... eu fiquei até mais tarde, bebendo sozinho depois da discussão. Menti porque tive vergonha, não porque fiz algo.'\n")
                    }
                    senao
                    {
                        escreva("\nVocê ainda não tem informações suficientes para confrontar Renato sobre isso.\n")
                    }
                pare
                caso 2:
                    se(contradicaoBeatriz == verdadeiro)
                    {
                        escrevaLenta("\nBeatriz baixa a cabeça, envergonhada. 'Eu cheguei mais cedo, é verdade. Fui procurar os papéis do testamento escondida. Tinha medo de ser deixada de fora. Mas eu juro que não toquei nele.'\n")
                    }
                    senao
                    {
                        escreva("\nVocê ainda não tem informações suficientes para confrontar Beatriz sobre isso.\n")
                    }
                pare
                caso 3:
                    se(contradicaoPorta == verdadeiro)
                    {
                        escrevaLenta("\nA governanta enrijece visivelmente. 'Eu... não sei explicar isso. Talvez algum dos outros tenha mexido na chave. Eu já disse tudo o que sei.' Ela evita seu olhar pelo resto da conversa.\n")
                    }
                    senao
                    {
                        escreva("\nVocê ainda não tem informações suficientes para confrontar a governanta sobre isso.\n")
                    }
                pare
                caso 4:
                    escrevaLenta("\nVocê decide que é hora de organizar suas conclusões.\n")
                pare
                caso contrario:
                    escreva("\nOpção inválida.\n")
                pare
            }
        }enquanto(escolhaDia2 != 4)
    }

    // ================================================
    // QUADRO DE DEDUCAO
    // ================================================
    funcao quadroDeDeducao()
    {
        inteiro resposta

        escreva("\n\n===============================================\n")
        escreva("      QUADRO DE INVESTIGAÇÃO\n")
        escreva("===============================================\n")
        escrevaLenta("Você organiza tudo o que descobriu em um quadro de investigação, tentando montar o quebra-cabeça.\n")

        escreva("\n1) Qual detalhe indica que o crime não foi cometido por um invasor externo?\n")
        escreva("1 - A janela estava fechada por dentro\n")
        escreva("2 - O bilhete estava em inglês\n")
        escreva("3 - A porta da frente estava aberta\n")
        escreva("Resposta: ")
        leia(resposta)
        se(resposta == 1)
        {
            escrevaLenta("Correto! Isso indica que quem entrou na biblioteca tinha acesso pela porta, ou seja, provavelmente alguém de dentro da casa.\n")
            pontosDeducao = pontosDeducao + 1
        }
        senao
        {
            escrevaLenta("Não exatamente. A janela fechada por dentro é o detalhe que descarta um invasor externo.\n")
        }

        escreva("\n2) O que a chave da biblioteca estar do lado de dentro mais cedo, e depois a porta ser encontrada trancada por fora, sugere?\n")
        escreva("1 - Que a porta nunca foi trancada de verdade\n")
        escreva("2 - Que alguém estava dentro, saiu e trancou por fora depois\n")
        escreva("3 - Que a chave foi perdida antes do crime\n")
        escreva("Resposta: ")
        leia(resposta)
        se(resposta == 2)
        {
            escrevaLenta("Correto! Alguém que estava dentro da biblioteca saiu dela e trancou a porta por fora, provavelmente para simular uma cena diferente da real.\n")
            pontosDeducao = pontosDeducao + 1
        }
        senao
        {
            escrevaLenta("Pense de novo: a chave mudou de lado, o que sugere que alguém trancou a porta por fora depois de estar dentro.\n")
        }

        escreva("\n3) Renato e Beatriz mentiram sobre seus horários, mas após confrontados, ambos deram explicações plausíveis e sem provas contra eles. O que isso sugere sobre os dois?\n")
        escreva("1 - Que certamente um deles é o assassino\n")
        escreva("2 - Que mentiram por vergonha, não por culpa no crime\n")
        escreva("3 - Que a polícia deve prendê-los imediatamente\n")
        escreva("Resposta: ")
        leia(resposta)
        se(resposta == 2)
        {
            escrevaLenta("Correto! Mentir não significa ser culpado de assassinato. As explicações de ambos fazem sentido e não os ligam diretamente ao crime.\n")
            pontosDeducao = pontosDeducao + 1
        }
        senao
        {
            escrevaLenta("Cuidado com essa conclusão: nem toda mentira esconde um assassinato. As explicações de Renato e Beatriz parecem plausíveis.\n")
        }

        escreva("\n4) A governanta afirma ter ouvido gritos 'de fora' às 22h, com a porta já trancada. Isso bate com a história da chave?\n")
        escreva("1 - Sim, perfeitamente\n")
        escreva("2 - Não, há uma inconsistência entre as duas histórias\n")
        escreva("Resposta: ")
        leia(resposta)
        se(resposta == 2)
        {
            escrevaLenta("Correto! Se a chave estava por dentro mais cedo e a porta foi encontrada trancada por fora, a história da governanta não se sustenta completamente.\n")
            pontosDeducao = pontosDeducao + 1
        }
        senao
        {
            escrevaLenta("Reveja os detalhes: a posição da chave muda ao longo da noite, o que contradiz a versão da governanta.\n")
        }

        se(documentoEncontrado == verdadeiro)
        {
            escreva("\n5) O documento encontrado no compartimento secreto sugere o quê sobre a vida do Sr. Aldric?\n")
            escreva("1 - Que ele tinha uma filha não reconhecida\n")
            escreva("2 - Que ele era adotado\n")
            escreva("3 - Que o documento não tem relação com o caso\n")
            escreva("Resposta: ")
            leia(resposta)
            se(resposta == 1)
            {
                escrevaLenta("Correto! Tudo indica que existe uma filha de Aldric que ele nunca reconheceu publicamente.\n")
                pontosDeducao = pontosDeducao + 1
            }
            senao
            {
                escrevaLenta("Pense melhor: uma certidão de nascimento escondida, com o nome do pai rasgado, sugere um filho ou filha não reconhecida.\n")
            }
        }

        escreva("\nVocê reuniu ", pontosDeducao, " pontos de dedução correta.\n")
    }

    // ================================================
    // ACUSACAO FINAL
    // ================================================
    funcao confrontoFinal()
    {
        inteiro acusado
        inteiro evidenciasTotal

        escreva("\n\n===============================================\n")
        escreva("      A ACUSAÇÃO FINAL\n")
        escreva("===============================================\n")
        escrevaLenta("É hora de apontar o culpado. Escolha com cuidado: não haverá segunda chance.\n\n")
        escreva("1 - Acusar a governanta\n")
        escreva("2 - Acusar Beatriz\n")
        escreva("3 - Acusar Renato\n")
        escreva("Escolha: ")
        leia(acusado)

        se(acusado != 1)
        {
            finalCulpadoEscapa()
        }
        senao
        {
            confrontarGovernanta()

            evidenciasTotal = totalPistas
            se(contradicaoPorta == verdadeiro)
            {
                evidenciasTotal = evidenciasTotal + 1
            }
            se(documentoEncontrado == verdadeiro)
            {
                evidenciasTotal = evidenciasTotal + 1
            }

            se(evidenciasTotal <= 1)
            {
                finalCulpaSemProvas()
            }
            senao
            {
                se(evidenciasTotal <= 3)
                {
                    finalJusticaFeita()
                }
                senao
                {
                    se(documentoEncontrado == verdadeiro)
                    {
                        finalVerdadeOuSegredo()
                    }
                    senao
                    {
                        finalJusticaFeita()
                    }
                }
            }
        }
    }

    funcao confrontarGovernanta()
    {
        inteiro escolhaProva

        escrevaLenta("Você chama a governanta para uma última conversa, desta vez apresentando o que descobriu.\n")

        faca
        {
            escreva("\n--- Qual prova deseja apresentar? ---\n")
            escreva("1 - A inconsistência da porta trancada\n")
            escreva("2 - O bilhete ameaçador\n")
            escreva("3 - O documento do compartimento secreto\n")
            escreva("4 - Encerrar e dar o veredito\n")
            escreva("Escolha: ")
            leia(escolhaProva)

            escolha(escolhaProva)
            {
                caso 1:
                    se(contradicaoPorta == verdadeiro)
                    {
                        escrevaLenta("\nA governanta desvia o olhar novamente, sem conseguir explicar a chave.\n")
                    }
                    senao
                    {
                        escreva("\nVocê não reuniu essa informação durante a investigação.\n")
                    }
                pare
                caso 2:
                    se(pistaBilhete == verdadeiro)
                    {
                        escrevaLenta("\nAo ver o bilhete, as mãos dela começam a tremer visivelmente.\n")
                    }
                    senao
                    {
                        escreva("\nVocê não coletou essa prova durante a investigação.\n")
                    }
                pare
                caso 3:
                    se(documentoEncontrado == verdadeiro)
                    {
                        escrevaLenta("\nAo ver o documento, a governanta finalmente começa a chorar, incapaz de manter a compostura.\n")
                    }
                    senao
                    {
                        escreva("\nVocê não encontrou nenhum documento durante a investigação.\n")
                    }
                pare
                caso 4:
                    escreva("\nVocê decide que já apresentou o suficiente.\n")
                pare
                caso contrario:
                    escreva("\nOpção inválida.\n")
                pare
            }
        }enquanto(escolhaProva != 4)
    }

    // ================================================
    // FINAIS DO JOGO
    // ================================================
    funcao finalCulpadoEscapa()
    {
        escreva("\n\n########## FINAL: O CULPADO ESCAPA ##########\n")
        escrevaLenta("Sua acusação não se sustenta e o verdadeiro culpado permanece livre. Dias depois, você descobre que a governanta deixou a cidade sem deixar rastros. O caso Rosemont é arquivado, e uma sombra de dúvida nunca deixa sua mente.\n")
        escreva("###############################################\n")
    }

    funcao finalCulpaSemProvas()
    {
        escreva("\n\n########## FINAL: CULPA SEM PROVAS ##########\n")
        escrevaLenta("Você aponta a pessoa certa, mas suas provas são fracas demais. A promotoria se recusa a levar o caso adiante e a governanta é solta por falta de provas. Você sabe a verdade, mas não pode prová-la - e essa é uma sensação amarga.\n")
        escreva("###############################################\n")
    }

    funcao finalJusticaFeita()
    {
        escreva("\n\n########## FINAL: JUSTIÇA FEITA ##########\n")
        escrevaLenta("Com provas sólidas, a governanta é presa e condenada pelo assassinato do Sr. Aldric Rosemont. O caso é oficialmente encerrado, mas o verdadeiro motivo por trás do crime nunca é revelado ao público. Só você sabe que havia mais por trás daquela noite.\n")
        escreva("###########################################\n")
    }

    funcao finalVerdadeOuSegredo()
    {
        caracter entregarDocumento

        escrevaLenta("\nAo ser confrontada com todas as provas, a governanta finalmente desaba e conta tudo: ela é filha não reconhecida do Sr. Aldric, escondida por décadas, criada na própria casa que deveria ter herdado. O bilhete era um aviso dela mesma, após descobrir que ele finalmente pensava em revelar a verdade a Beatriz.\n\n")
        escreva("Você tem em mãos o documento que prova tudo isso. Quer entregá-lo à polícia junto com o resto das provas? [s/n]: ")
        leia(entregarDocumento)

        se(entregarDocumento == 's')
        {
            finalVerdadeCompleta()
        }
        senao
        {
            finalSegredoEnterrado()
        }
    }

    funcao finalVerdadeCompleta()
    {
        escreva("\n\n########## FINAL: A VERDADE COMPLETA ##########\n")
        escrevaLenta("A história completa vem à tona: uma filha escondida, décadas de rejeição e um segredo que finalmente explode. A governanta é condenada, mas o caso Rosemont se torna conhecido por muito mais do que um simples assassinato - uma lição sobre o peso dos segredos de família.\n")
        escreva("################################################\n")
    }

    funcao finalSegredoEnterrado()
    {
        escreva("\n\n########## FINAL: SEGREDO ENTERRADO ##########\n")
        escrevaLenta("Você guarda o documento consigo e nunca o entrega. A governanta é condenada pelo crime, mas a verdadeira história por trás dele morre com você. Foi justiça, ou apenas mais um segredo da família Rosemont escondido por mais uma pessoa? Só você saberá a resposta.\n")
        escreva("###############################################\n")
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 268; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */