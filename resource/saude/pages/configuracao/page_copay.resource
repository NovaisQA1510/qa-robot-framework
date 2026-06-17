*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Copay
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_CoPay}
    
    # Validação
    Wait For Elements State    ${config_copay_lbl_calculo_copay}   state=visible
    Wait For Elements State    ${config_copay_btn_processar}    state=visible
    Wait For Elements State    ${erro_CDbException}    state=detached
    Wait For Elements State    ${erro_php_traces}    state=detached