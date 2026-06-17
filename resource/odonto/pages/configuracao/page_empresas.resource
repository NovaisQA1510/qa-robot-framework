*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Empresas
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_empresas}
    
    # Validação
    Wait For Elements State    ${config_empresa_lbl_empresas}   state=visible
    Wait For Elements State    ${config_empresa_btn_cadastrar_empresa}    state=visible
    Wait For Elements State    ${config_config_lbl_tipo_dado_odonto}    state=visible
