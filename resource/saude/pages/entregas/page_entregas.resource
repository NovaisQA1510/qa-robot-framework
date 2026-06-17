*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Entregas
    
    # Navegação
    Click    ${mnu_entregas} 
    
    # Validação
    Wait For Elements State    ${entregas_ddl_selecione_empresa}   state=visible
    Wait For Elements State    ${entregas_btn_filtrar}    state=visible

Validação de Empresa Existente em: Entregas
    [Arguments]    ${status}    ${empresa}

    Click    xpath=*//button[@title="Selecione uma empresa"]

    ${retorno}       Run Keyword And Return Status    Get Element    xpath=*//div[@id="panel-geral"]//ul[@class="multiselect-container dropdown-menu"]//label[normalize-space(text())='${empresa.empresa}']

    IF    "${status}" == "True"
        Should Be True    ${retorno}
        Log To Console    \n${empresa.empresa} existe - VALIDADO COM SUCESSO (Entregas)
    ELSE 
        Should Not Be True    ${retorno}
        Log To Console    \n${empresa.empresa} não existe - VALIDADO COM SUCESSO (Entregas)
    END