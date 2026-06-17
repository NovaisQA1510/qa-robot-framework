*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Sinistro Plano Per Capita
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_sinistro_agregado_planos_per_capita} 

    
    # Validação
    Wait For Elements State    ${relatorio_sinistro_planos_per_capita_lbl_quantidade_evento_per_capita}   state=visible
    Wait For Elements State    ${relatorio_sinistro_planos_per_capita_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_sinistro_planos_per_capita_btn_legenda_planos}    state=visible
    Wait For Elements State    ${relatorio_sinistro_planos_per_capita_lbl_grafico}    state=visible
    Wait For Elements State    ${relatorio_sinistro_planos_per_capita_lbl_tabela}    state=visible