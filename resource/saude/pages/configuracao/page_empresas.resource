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
    Wait For Elements State    ${erro_CDbException}    state=detached
    Wait For Elements State    ${erro_php_traces}    state=detached

Validação de Empresa Existente em: Configuração - Empresas
    [Arguments]    ${status}    ${empresa}

    Click        ${config_empresa_txt_empresa}
    Type Text    ${config_empresa_txt_empresa}    ${empresa.empresa} 
    Click        ${config_empresa_txt_empresa_buscar} 
    Sleep    3s

    IF    "${status}" == "True"
        ${table}    Get Text    xpath=*//tbody
        Should Contain    ${table}    ${empresa.empresa}
        Log To Console    \n${empresa.empresa} existe - VALIDADO COM SUCESSO (Configuração - Empresas)
    ELSE 
        Should Not Exist    xpath=*//tbody
        Log To Console    \n${empresa.empresa} não existe - VALIDADO COM SUCESSO (Configuração - Empresas)
    END