*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Individual High Users do Mes
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_high_users_do_mes}
    
    # Validação
    Wait For Elements State    ${individual_high_users_do_mes_lbl_high_users_do_mes}   state=visible
    Wait For Elements State    ${individual_high_users_do_mes_btn_CSV}                state=visible