*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação para Relatórios - Evolução por Métricas
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_rede_x_reembolso_evolucao_por_metricas}
    
    # Validação
    Wait For Elements State    ${rede_x_reembolso_lbl_evolucao_rede_e_reembolso}   state=visible
    Wait For Elements State    ${rede_x_reembolso_btn_csv}                         state=visible
    