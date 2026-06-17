*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Sinistro Planos
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_sinistro_agregado_Planos} 

    
    # Validação
    Wait For Elements State    ${relatorio_sinistro_planos_lbl_sinistro_por_planos}   state=visible
    Wait For Elements State    ${relatorio_sinistro_planos_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_sinistro_planos_btn_legenda_planos}    state=visible
    Wait For Elements State    ${relatorio_sinistro_planos_lbl_tabela}    state=visible