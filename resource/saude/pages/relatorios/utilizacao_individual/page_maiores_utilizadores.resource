*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Maiores Utilizadores
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_individual_maiores_utilizadores}
  
    # Validação
    Wait For Elements State    ${relatorio_maiores_utilizadores_lbl_maiores_utilizadores}     state=visible
    Wait For Elements State    ${relatorio_maiores_utilizadores_btn_csv}                      state=visible