*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação para Relatórios - Evolução por Plano
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_evolucao_por_plano}
    
    # Validação
    Wait For Elements State    ${evolucao_por_plano_lbl_sinistro_por_plano}    state=visible
    Wait For Elements State    ${evolucao_por_plano_btn_csv}                   state=visible
    Wait For Elements State    ${evolucao_por_plano_btn_enviar}                state=visible
