*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Internações
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_internacoes} 
    Set Browser Timeout    timeout=60s

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_internacoes_lbl_evolucao_de_internacoes}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_internacoes_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_internacoes_lbl_Grafico}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_internacoes_lbl_qtd_ps_internadas}    state=visible
