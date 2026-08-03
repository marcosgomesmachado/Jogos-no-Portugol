programa {
  inclua biblioteca Texto --> txt
  inclua biblioteca Util --> u
  funcao inicio() {
    cadeia matriz[5][10]
    inteiro linha = u.sorteia(0, 4), coluna = u.sorteia(0, 9)

    para(inteiro i = 0; i < 5; i++){
      para(inteiro j = 0; j < 10; j++){
        se(linha == i e coluna == j){
          matriz[i][j] = "#"
        }senao{
          matriz[i][j] = "·"
        }
      }
    }
    para(inteiro i = 0; i < 5; i++){
      para(inteiro j = 0; j < 10; j++){
        escreva(matriz[i][j], "  ")
      }
      escreva("\n")
    }
  }
}
