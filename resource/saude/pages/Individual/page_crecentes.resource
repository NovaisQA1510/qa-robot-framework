*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Individual Crecente
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_crecentes}
    
    # Validação
    Wait For Elements State    ${individual_crecentes_lbl_crecentes}   state=visible
    Wait For Elements State    ${individual_crecentes_btn_filtrar}            state=visible
    Wait For Elements State    ${individual_crecentes_btn_CSV}                state=visible