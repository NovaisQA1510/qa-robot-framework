*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Titularidade
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_titularidade} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_titularidade_lbl_evolucao_do_sinistro_titularidade}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_titularidade_btn_csv}    state=visible
