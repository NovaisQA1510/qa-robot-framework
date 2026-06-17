*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Sinistro Titularidade e Sexo
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_sinistro_agregado_titularidade_sexo} 

    
    # Validação
    Wait For Elements State    ${relatorio_sinistro_titularidade_e_sexo_lbl_sinistro_por_grupo}   state=visible
    Wait For Elements State    ${relatorio_sinistro_titularidade_e_sexo_lbl_sinistro_por_sexo}    state=visible
    Wait For Elements State    ${relatorio_sinistro_titularidade_e_sexo_lbl_sinistro_por_titularidade}    state=visible
    Wait For Elements State    ${relatorio_sinistro_titularidade_e_sexo_btn_csv}    state=visible