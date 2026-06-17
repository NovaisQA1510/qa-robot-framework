*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Tratamento
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_tratamento} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_tratamento_lbl_evolucao_de_tratamento}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_tratamento_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_tratamento_lbl_Grafico}    state=visible
