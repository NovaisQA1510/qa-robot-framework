*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Individual High Users
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_high_users}
    
    # Validação
    Wait For Elements State    ${individual_high_users_lbl_high_users}   state=visible
    Wait For Elements State    ${individual_high_users_btn_CSV}                state=visible