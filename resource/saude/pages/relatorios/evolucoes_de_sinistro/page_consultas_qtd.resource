*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Consultas - Qtd
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_consultas_qtd} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_qtd_lbl_consultas_qtd_ps_eletiva}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_qtd_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_qtd_lbl_Grafico}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_qtd_lbl_Grafico_filtro}    state=visible
