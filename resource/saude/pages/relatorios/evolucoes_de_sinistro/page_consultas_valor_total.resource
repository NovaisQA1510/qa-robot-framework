*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Consultas - Valor Total 
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_consultas_valor_total} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_valor_total_lbl_consultas_valor_total_ps_eletiva}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_valor_total_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_valor_total_lbl_Grafico}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_valor_total_lbl_Grafico_filtro}    state=visible
