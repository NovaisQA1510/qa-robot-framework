*** Settings ***
Resource    base.resource

*** Variables ***

*** Keywords ***
Capturar elemento de tabela do BI
    [Arguments]   ${table_id}    ${elemento}    ${coluna}    ${erro_linha}=${False}    ${correcao}=0           
    
    ${table}=    Set Variable    xpath=//*[@id="${table_id}"] 
    ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"

    IF    "${erro_linha}" != "${False}"
        ${correcao}    Convert To Integer    ${correcao}
        ${elemento_index}    Evaluate    ${elemento_index}+${correcao}
    END

    ${xpath_elemento}    Set Variable    //*[@id="${table_id}"]/tbody/tr[${elemento_index}]/td[${coluna}]
    ${elemento_text}   Get Text    xpath=${xpath_elemento}

    RETURN    ${elemento_text}

Capturar elemento de tabela do BI - buscando 2 elementos
    [Arguments]   ${table_id}    ${elemento_linha}    ${elemento_coluna}            
    
    ${table}=    Set Variable    xpath=//*[@id="${table_id}"] 
    ${Cell_index}    Get Table Cell Index    ${table} >> "${elemento_coluna}"
    ${Cell_index}    Evaluate    ${Cell_index}+1
    ${elemento_index}    Get Table Row Index    ${table} >> "${elemento_linha}"
    ${xpath_elemento}    Set Variable    //*[@id="${table_id}"]/tbody/tr[${elemento_index}]/td[${Cell_index}]
    ${elemento_text}   Get Text    xpath=${xpath_elemento}

    RETURN    ${elemento_text}