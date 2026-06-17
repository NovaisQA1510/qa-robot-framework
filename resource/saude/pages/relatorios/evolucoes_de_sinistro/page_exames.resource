*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Exames
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_exames} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_exames_lbl_evolucao_de_exames}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_exames_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_exames_lbl_Grafico}    state=visible
