*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Importação de Dados
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_importacao_de_dados}
    
    # Validação
    Wait For Elements State    ${config_importacao_de_dados_lbl_listar}   state=visible
    Wait For Elements State    ${config_importacao_de_dados_btn_filtrar}    state=visible
    Wait For Elements State    ${erro_CDbException}    state=detached
    Wait For Elements State    ${erro_php_traces}    state=detached

Validação de Empresa Existente em: Configuração - Importação de Dados
    [Arguments]    ${status}    ${empresa}

    Click        xpath=*//div[@class="col-sm-4"]//div[@class="jdropdown-container-header"]/input[@class="jdropdown-header"]
    Sleep    1s

    IF    "${status}" == "True"
        ${empresa_encontrada}       Get Elements    xpath=*//div[@class="jdropdown-item"]/div[contains(text(),'${empresa.empresa}')]
        Should Not Be Empty    ${empresa_encontrada}
        
        ${empresa_encontrada_type}    Evaluate    type(${empresa_encontrada})

        IF    "${empresa_encontrada_type}" == "<class 'list'>"
            Should Contain    ${empresa_encontrada}[0]    ${empresa.empresa}
            Log To Console    \n${empresa.empresa} existe - VALIDADO COM SUCESSO (Importação de Dados)
        ELSE
            Should Contain    ${empresa_encontrada}    ${empresa.empresa}
            Log To Console    \n${empresa.empresa} existe - VALIDADO COM SUCESSO (Importação de Dados)
        END

    ELSE 
        ${retorno}       Run Keyword And Return Status    Get Text    xpath=*//div[@class="jdropdown-item"]/div[contains(text(),'${empresa.empresa}')]
        Should Not Be True    ${retorno}
        Log To Console    \n${empresa.empresa} não existe - VALIDADO COM SUCESSO (Importação de Dados)
    END