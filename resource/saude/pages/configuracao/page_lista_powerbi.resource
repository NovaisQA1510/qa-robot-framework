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
    Wait For Elements State    ${erro_CDbException}    state=detached
    Wait For Elements State    ${erro_php_traces}    state=detached

Validação de Empresa Existente em: Configuração - Lista PowerBI
    [Arguments]    ${status}    ${empresa}
    
    Validação dropdown list: Configuração - Lista PowerBI    ${status}    ${empresa}
    Validação tabela list: Configuração - Lista PowerBI    ${status}    ${empresa}
    
Validação dropdown list: Configuração - Lista PowerBI
    [Arguments]    ${status}    ${empresa}

    Click    ${config_powerbi_ddl_selecionar_empresa}   

    IF    "${status}" == "True"
        ${empresa_encontrada}       Get Elements    xpath=*//form[@id="form-busca"]//div[@class="jdropdown-container"]//div[contains(text(),'${empresa.empresa}')]
        Should Not Be Empty    ${empresa_encontrada}
        
        ${empresa_encontrada_type}    Evaluate    type(${empresa_encontrada})

        IF    "${empresa_encontrada_type}" == "<class 'list'>"
            Should Contain    ${empresa_encontrada}[0]    ${empresa.empresa}
            Log To Console    \n${empresa.empresa} existe em DDL - VALIDADO COM SUCESSO (Lista PowerBI)
        ELSE
            Should Contain    ${empresa_encontrada}    ${empresa.empresa}
            Log To Console    \n${empresa.empresa} existe em DDL - VALIDADO COM SUCESSO (Lista PowerBI)
        END

    ELSE 
        ${retorno}       Run Keyword And Return Status    Get Text    xpath=*//form[@id="form-busca"]//div[@class="jdropdown-container"]//div[contains(text(),'${empresa.empresa}')]
        Should Not Be True    ${retorno}
        Log To Console    \n${empresa.empresa} não existe em DDL - VALIDADO COM SUCESSO (Lista PowerBI)
    END

Validação tabela list: Configuração - Lista PowerBI
    [Arguments]    ${status}    ${empresa}

    IF    "${status}" == "True"
        ${empresa_encontrada}    Get Element By Role    role=ROW    all_elements=True    name=${empresa.empresa}
        Should Not Be Empty    ${empresa_encontrada}

        ${empresa_encontrada_type}    Evaluate    type(${empresa_encontrada})

        IF    "${empresa_encontrada_type}" == "<class 'list'>"
            Should Contain    ${empresa_encontrada}[0]    ${empresa.empresa}
            Log To Console    \n${empresa.empresa} existe nas tabelas - VALIDADO COM SUCESSO (Lista PowerBI)
        ELSE
            Should Contain    ${empresa_encontrada}    ${empresa.empresa}
            Log To Console    \n${empresa.empresa} existe nas tabelas - VALIDADO COM SUCESSO (Lista PowerBI)
        END

    ELSE 
        ${empresa_encontrada}    Get Element By Role    role=ROW    all_elements=True    name=${empresa.empresa}
        Should Be Empty    ${empresa_encontrada}

        Log To Console    \n${empresa.empresa} não existe nas tabelas - VALIDADO COM SUCESSO (Lista PowerBI)
    END