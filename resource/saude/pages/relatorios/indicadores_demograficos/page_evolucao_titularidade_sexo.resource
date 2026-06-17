*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Evolução por Titularidade/Sexo
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_indicadores_demograficos_evolucao_titularidade_sexo}
    
    # Validação
    Wait For Elements State    ${relatorio_indicadores_demograficos_evolucao_titularidade_sexo_lbl_evolucao}   state=visible
    Wait For Elements State    ${relatorio_indicadores_demograficos_evolucao_titularidade_sexo_btn_download_csv}    state=visible

