*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Per Capita
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_per_capita} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_per_capita_lbl_composicao_de_evento}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_per_capita_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_per_capita_lbl_mes_a_mes}    state=visible
