*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Maiores Utilizadores Do Mês
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_individual_maiores_utilizador_do_mes} 
 
    # Validação
    Wait For Elements State    ${relatorio_maiores_utilizadores_do_mes_lbl_maiores_utilizadores_do_mes}     state=visible
    Wait For Elements State    ${relatorio_maiores_utilizadores_do_mes_btn_csv}                             state=visible