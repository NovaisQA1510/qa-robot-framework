*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Evolução Por Metricas  
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_rede_x_reembolso_evolucao_por_metricas} 

    
    # Validação
    Wait For Elements State    ${relatorio_rede_reembolso_evolucao_por_metricas_lbl_evolucao_rede_reembolso}   state=visible
    Wait For Elements State    ${relatorio_rede_reembolso_evolucao_por_metricas_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_rede_reembolso_evolucao_por_metricas_lbl_select_tipo_evento}    state=visible
    Wait For Elements State    ${relatorio_rede_reembolso_evolucao_por_metricas_lbl_grafico}    state=visible
