*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Labs Hipercosultores
    # Navegação
    Click    ${mnu_labs}
    Click    ${mnu_labs_hiperconsultores} 
    
    # Validação
    Wait For Elements State    ${hiperconsultadores_lbl_hiperconsultadores}   state=visible
    Wait For Elements State    ${hiperconsultadores_btn_CSV}    state=visible