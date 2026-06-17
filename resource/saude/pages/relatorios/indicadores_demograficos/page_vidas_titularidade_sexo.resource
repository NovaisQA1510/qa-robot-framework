*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Vidas por Titularidade e Sexo
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_indicadores_demograficos_vidas_titularidade_sexo}
    
    # Validação
    Wait For Elements State    ${relatorio_indicadores_demograficos_vidas_titularidade_sexo_lbl_qtd_vidas_grupo}   state=visible
    Wait For Elements State    ${relatorio_indicadores_demograficos_vidas_titularidade_sexo_btn_download_csv}    state=visible

