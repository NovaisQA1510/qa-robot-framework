*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Evolução por Titularidade e Sexo
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_evolucao_por_titularidade_sexo} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_evolucao_por_titularidade_e_sexo_lbl_evolucao_de_sinistro_por_titularidade_sexo_mes}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_evolucao_por_titularidade_e_sexo_btn_csv}    state=visible
