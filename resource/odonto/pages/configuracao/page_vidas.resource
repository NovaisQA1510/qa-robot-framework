*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Vidas
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_vidas}
    
    # Validação
    Wait For Elements State    ${config_vidas_lbl_vidas_faturamento}   state=visible
    Wait For Elements State    ${config_vidas_btn_csv}    state=visible
    Wait For Elements State    ${config_config_lbl_tipo_dado_odonto}    state=visible
