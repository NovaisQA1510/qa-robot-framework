*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação para Relatórios - Evolucao do Sinistro
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_resumo_de_indicadores_evolucao_do_sinistro}
    
    # Validação
    Wait For Elements State    ${evolucao_do_sinistro_lbl_resumo_financeiro_plantas_pos_pagamento}   state=visible
    Wait For Elements State    ${evolucao_do_sinistro_btn_csv}    state=visible
    