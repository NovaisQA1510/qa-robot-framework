*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Consultas
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_consultas} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_lbl_evolucao_de_consultas}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_consultas_lbl_Grafico}    state=visible
