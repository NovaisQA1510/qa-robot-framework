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
    Wait For Elements State    ${config_config_lbl_tipo_dado_odonto}    state=visible
