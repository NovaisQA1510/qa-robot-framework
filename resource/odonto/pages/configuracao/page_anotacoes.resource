*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Anotações
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_anotacoes}
    
    # Validação
    Wait For Elements State    ${config_anotacoes_lbl_anotacoes}   state=visible
    Wait For Elements State    ${config_anotacoes_btn_salvar}    state=visible
    Wait For Elements State    ${config_config_lbl_tipo_dado_odonto}    state=visible
