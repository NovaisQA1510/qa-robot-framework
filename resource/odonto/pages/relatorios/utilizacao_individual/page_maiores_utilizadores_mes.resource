*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação para Relatórios - Maiores Utilizadores Do Mês 
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_indidual_maiores_utilizadores_do_mes}
    
    # Validação
    Wait For Elements State    ${maiores_utilizadores_mes_lbl_maiores_utilizadores_do_mes}   state=visible
    Wait For Elements State    ${maiores_utilizadores_mes_btn_csv}    state=visible
   