*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação para Relatórios - Evolução de Vidas
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_indicadores_demograficos_evolucao_de_vidas}
    
    # Validação
    Wait For Elements State    ${evolucao_de_vidas_lbl_evolucao_populacional}   state=visible
    Wait For Elements State    ${evolucao_de_vidas_btn_csv}    state=visible
    