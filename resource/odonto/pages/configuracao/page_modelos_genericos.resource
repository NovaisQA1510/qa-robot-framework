*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Modelos Genéricos
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_modelos_genericos}
    
    # Validação
    Wait For Elements State    ${config_modelos_genericos_btn_novo_modelo}   state=visible
    Wait For Elements State    ${config_modelos_genericos_btn_filtrar}    state=visible
    Wait For Elements State    ${config_config_lbl_tipo_dado_odonto}    state=visible
