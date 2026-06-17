*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação para Relatórios - Maiores Utilizadores
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_indidual_maiores_utilizadores}
    
    # Validação
    Wait For Elements State    ${maiores_utilizadores_lbl_maiores_utilizadores}   state=visible
    Wait For Elements State    ${maiores_utilizadores_btn_csv}    state=visible
   