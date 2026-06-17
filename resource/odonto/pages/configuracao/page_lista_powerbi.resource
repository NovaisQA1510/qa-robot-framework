*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Power BI
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_lista_powerBI}
    
    # Validação
    Wait For Elements State    ${config_powerbi_lbl_relatorios_powerbi}   state=visible
    Wait For Elements State    ${config_powerbi_btn_filtrar}    state=visible
    Wait For Elements State    ${config_config_lbl_tipo_dado_odonto}    state=visible
