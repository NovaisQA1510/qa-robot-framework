*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Resumo Indicadores Gerais por Mes
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_resumo_de_indicadores_Gerais_por_mes}
    
    # Validação
    Wait For Elements State    ${relatorio_resumo_de_indicadores_gerais_por_mes_lbl_indicadores_gerais}   state=visible
    Wait For Elements State    ${relatorio_resumo_de_indicadores_gerais_por_mes_lbl_indicadores}        state=visible

Ler arquivo csv - Resumo Indicadores - Indicadores Gerais por Mes
    [Arguments]    ${arquivo}    

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    ${coluna_1}   Create List
    ${coluna_2}   Create List
    ${coluna_3}   Create List
    ${coluna_4}   Create List
    ${coluna_5}   Create List
    ${coluna_6}   Create List
    ${coluna_7}   Create List
    ${coluna_8}   Create List
    
    Remove From List     ${data}              0
    
    FOR      ${elemento}   IN   @{data}

        Append To List    ${coluna_1}    ${elemento}[0]
        Append To List    ${coluna_2}    ${elemento}[1]
        Append To List    ${coluna_3}    ${elemento}[2]
        Append To List    ${coluna_4}    ${elemento}[3]
        Append To List    ${coluna_5}    ${elemento}[4]
        Append To List    ${coluna_6}    ${elemento}[5]
        Append To List    ${coluna_7}    ${elemento}[6]
        Append To List    ${coluna_8}    ${elemento}[7]

    END
     
    RETURN    ${coluna_1}    ${coluna_2}    ${coluna_3}    ${coluna_4}    ${coluna_5}    ${coluna_6}    ${coluna_7}    ${coluna_8}

Capturar e Validar tabela Resumo Indicadores - Indicadores Gerais por Mês
    [Arguments]    ${coluna_1}    ${coluna_2}    ${coluna_3}    ${coluna_4}    ${coluna_5}    ${coluna_6}    ${coluna_7}    ${coluna_8}

    ${lista_coluna_1}   Create List
    ${lista_coluna_2}   Create List
    ${lista_coluna_3}   Create List
    ${lista_coluna_4}   Create List
    ${lista_coluna_5}   Create List
    ${lista_coluna_6}   Create List
    ${lista_coluna_7}   Create List
    ${lista_coluna_8}   Create List

    ${table}=    Set Variable    xpath=//*[@id="table01"] 

    FOR    ${elemento}    IN    @{coluna_1}
        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"

        ${elemento_coluna_2}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[2]
        ${elemento_coluna_3}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[3]
        ${elemento_coluna_4}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[4]
        ${elemento_coluna_5}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[5]
        ${elemento_coluna_6}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[6]
        ${elemento_coluna_7}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[7]
        ${elemento_coluna_8}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[8]

        ${valor_coluna_2}    Get Text    xpath=${elemento_coluna_2}
        ${valor_coluna_3}    Get Text    xpath=${elemento_coluna_3}
        ${valor_coluna_4}    Get Text    xpath=${elemento_coluna_4}
        ${valor_coluna_5}    Get Text    xpath=${elemento_coluna_5}
        ${valor_coluna_6}    Get Text    xpath=${elemento_coluna_6}
        ${valor_coluna_7}    Get Text    xpath=${elemento_coluna_7}
        ${valor_coluna_8}    Get Text    xpath=${elemento_coluna_8}


        Append To List    ${lista_coluna_2}       ${valor_coluna_2}
        Append To List    ${lista_coluna_3}       ${valor_coluna_3}
        Append To List    ${lista_coluna_4}       ${valor_coluna_4}
        Append To List    ${lista_coluna_5}       ${valor_coluna_5}
        Append To List    ${lista_coluna_6}       ${valor_coluna_6}
        Append To List    ${lista_coluna_7}       ${valor_coluna_7}
        Append To List    ${lista_coluna_8}       ${valor_coluna_8}     
    END

    Lists Should Be Equal    ${lista_coluna_2}      ${coluna_2}
    Lists Should Be Equal    ${lista_coluna_3}      ${coluna_3}
    Lists Should Be Equal    ${lista_coluna_4}      ${coluna_4}
    Lists Should Be Equal    ${lista_coluna_5}      ${coluna_5}
    Lists Should Be Equal    ${lista_coluna_6}      ${coluna_6}
    Lists Should Be Equal    ${lista_coluna_7}      ${coluna_7}
    Lists Should Be Equal    ${lista_coluna_8}      ${coluna_8}
