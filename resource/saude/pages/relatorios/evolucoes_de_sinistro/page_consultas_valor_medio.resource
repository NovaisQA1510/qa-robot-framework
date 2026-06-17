*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Consultas - Valor Medio 
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_consultas_valor_medio} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_valor_medio_consultas_valor_medio_ps_eletiva}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_valor_medio_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_valor_medio_lbl_Grafico}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_valor_medio_lbl_Grafico_filtro}    state=visible
