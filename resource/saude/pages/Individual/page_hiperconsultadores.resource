*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Individual Hiperconsultadores
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_hiperconsultadores}
    
    # Validação
    Wait For Elements State    ${individual_hiperconsultadores_lbl_hiperconsultadores_eletivas}   state=visible
    Wait For Elements State    ${individual_hiperconsultadores_utilizacao_btn_filtrar}            state=visible
    Wait For Elements State    ${individual_hiperconsultadores_utilizacao_btn_CSV}                state=visible