*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Evolução por Descritores
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_evolucao_por_descritores} 
    Set Browser Timeout    timeout=60s
    
    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_evolucao_por_descritores_lbl_sinistro_evento}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_evolucao_por_descritores_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_evolucao_por_descritores_btn_enviar}    state=visible
