*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Outros 
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_outros} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_outros_lbl_evolucao_de_outros_custos}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_outros_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_outros_lbl_Grafico}    state=visible
