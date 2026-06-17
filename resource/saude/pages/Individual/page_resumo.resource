*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Individual Resumo
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_resumo}
    
    # Validação
    Wait For Elements State    ${individual_resumo_lbl_resumo}   state=visible
    Wait For Elements State    ${individual_resumo_btn_CSV}    state=visible


Ler arquivo csv - Individual - Resumo - Tabela
    [Arguments]    ${arquivo}    

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    Remove From List     ${data}              0
    Remove From List     ${data}              0
    Remove From List     ${data}              -1
   

    ${lista_coluna_1}                  Create List
    ${lista_coluna_2}                  Create List 
    ${lista_coluna_3}                  Create List
    ${lista_coluna_4}                  Create List
    ${lista_coluna_5}                  Create List
    ${lista_coluna_6}                  Create List
    ${lista_coluna_7}                  Create List
    ${lista_coluna_8}                  Create List
    ${lista_coluna_9}                  Create List
    ${lista_coluna_10}                 Create List
    ${lista_coluna_11}                 Create List


    ${contador}    Set Variable    0

    FOR      ${elemento}   IN   @{data}

        Append To List    ${lista_coluna_1}                 ${elemento}[0]
        Should Not Be Empty    ${elemento}[0]
        Append To List    ${lista_coluna_2}                 ${elemento}[1]
        Should Not Be Empty    ${elemento}[1]
        Append To List    ${lista_coluna_3}                 ${elemento}[2]
        Should Not Be Empty    ${elemento}[2]
        Append To List    ${lista_coluna_4}                 ${elemento}[3]
        Should Not Be Empty    ${elemento}[3]
        Append To List    ${lista_coluna_5}                 ${elemento}[4]
        Should Not Be Empty    ${elemento}[4]
        Append To List    ${lista_coluna_6}                 ${elemento}[5]
        Should Not Be Empty    ${elemento}[5]
        Append To List    ${lista_coluna_7}                 ${elemento}[6]
        Should Not Be Empty    ${elemento}[6]
        Append To List    ${lista_coluna_8}                 ${elemento}[7]
        Should Not Be Empty    ${elemento}[7]
        Append To List    ${lista_coluna_9}                 ${elemento}[8]
        Should Not Be Empty    ${elemento}[8]
        Append To List    ${lista_coluna_10}                 ${elemento}[9]
        Should Not Be Empty    ${elemento}[9]
        Append To List    ${lista_coluna_11}                 ${elemento}[10]
        Should Not Be Empty    ${elemento}[10]

        ${contador}    Evaluate    ${contador}+1
        Exit For Loop If    ${contador}==10

    END

    


    RETURN    ${lista_coluna_1}       ${lista_coluna_2}    ${lista_coluna_3}    
    ...    ${lista_coluna_4}    ${lista_coluna_5}    ${lista_coluna_6}    
    ...    ${lista_coluna_7}    ${lista_coluna_8}    ${lista_coluna_9}    
    ...    ${lista_coluna_10}    ${lista_coluna_11}        
    
Capturar e Validar tabela Resumo - Individual - Resumo - Tabela
    [Arguments]    ${lista_coluna_1}    ${lista_coluna_2}    ${lista_coluna_3}    
    ...    ${lista_coluna_4}    ${lista_coluna_5}    ${lista_coluna_6}    ${lista_coluna_7}    
    ...    ${lista_coluna_8}    ${lista_coluna_9}    ${lista_coluna_10}    ${lista_coluna_11}     

    ${lista_valores_coluna_1}                Create List
    ${lista_valores_coluna_2}                Create List 
    ${lista_valores_coluna_3}                Create List
    ${lista_valores_coluna_4}                Create List
    ${lista_valores_coluna_5}                Create List
    ${lista_valores_coluna_6}                Create List
    ${lista_valores_coluna_7}                Create List
    ${lista_valores_coluna_8}                Create List
    ${lista_valores_coluna_9}                Create List
    ${lista_valores_coluna_10}                Create List
    ${lista_valores_coluna_11}                Create List


    ${table}=    Set Variable    xpath=//*[@id="datatable-100"] 
    
    ${contador}    Set Variable    0
    
    FOR    ${elemento}    IN    @{lista_coluna_1}

        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    //*[@id="datatable-100"]/tbody//td[1] >> "${elemento}"
        
        
        ${elemento_2}               Set Variable    //*[@id="datatable-100"]/tbody/tr[${elemento_index}]/td[2]
        ${elemento_3}               Set Variable    //*[@id="datatable-100"]/tbody/tr[${elemento_index}]/td[3]
        ${elemento_4}               Set Variable    //*[@id="datatable-100"]/tbody/tr[${elemento_index}]/td[4]
        ${elemento_5}               Set Variable    //*[@id="datatable-100"]/tbody/tr[${elemento_index}]/td[5]
        ${elemento_6}               Set Variable    //*[@id="datatable-100"]/tbody/tr[${elemento_index}]/td[6]
        ${elemento_7}               Set Variable    //*[@id="datatable-100"]/tbody/tr[${elemento_index}]/td[7]
        ${elemento_8}               Set Variable    //*[@id="datatable-100"]/tbody/tr[${elemento_index}]/td[8]
        ${elemento_9}               Set Variable    //*[@id="datatable-100"]/tbody/tr[${elemento_index}]/td[9]
        ${elemento_10}               Set Variable    //*[@id="datatable-100"]/tbody/tr[${elemento_index}]/td[10]
        ${elemento_11}               Set Variable    //*[@id="datatable-100"]/tbody/tr[${elemento_index}]/td[11]


        ${valor_coluna2}                Get Text    xpath=${elemento_2}  
        Should Not Be Empty    ${valor_coluna2}  
        ${valor_coluna3}                Get Text    xpath=${elemento_3}
        Should Not Be Empty    ${valor_coluna3}
        ${valor_coluna4}                Get Text    xpath=${elemento_4}
        Should Not Be Empty    ${valor_coluna4}
        ${valor_coluna5}                Get Text    xpath=${elemento_5}
        Should Not Be Empty    ${valor_coluna5}
        ${valor_coluna6}                Get Text    xpath=${elemento_6}
        Should Not Be Empty    ${valor_coluna6}
        ${valor_coluna7}                Get Text    xpath=${elemento_7}
        Should Not Be Empty    ${valor_coluna7}
        ${valor_coluna8}                Get Text    xpath=${elemento_8}
        Should Not Be Empty    ${valor_coluna8}
        ${valor_coluna9}                Get Text    xpath=${elemento_9}
        Should Not Be Empty    ${valor_coluna9}
        ${valor_coluna10}               Get Text    xpath=${elemento_10}
        Should Not Be Empty    ${valor_coluna10}
        ${valor_coluna11}               Get Text    xpath=${elemento_11}
        Should Not Be Empty    ${valor_coluna11}

        Append To List    ${lista_valores_coluna_2}                  ${valor_coluna2}
        Append To List    ${lista_valores_coluna_3}                  ${valor_coluna3}
        Append To List    ${lista_valores_coluna_4}                  ${valor_coluna4}
        Append To List    ${lista_valores_coluna_5}                  ${valor_coluna5}
        Append To List    ${lista_valores_coluna_6}                  ${valor_coluna6}
        Append To List    ${lista_valores_coluna_7}                  ${valor_coluna7}
        Append To List    ${lista_valores_coluna_8}                  ${valor_coluna8}
        Append To List    ${lista_valores_coluna_9}                  ${valor_coluna9}
        Append To List    ${lista_valores_coluna_10}                 ${valor_coluna10}
        Append To List    ${lista_valores_coluna_11}                 ${valor_coluna11}
        
        ${contador}    Evaluate    ${contador}+1
        Exit For Loop If    ${contador}==10

    END

    Lists Should Be Equal    ${lista_valores_coluna_2}                  ${lista_coluna_2}
    Lists Should Be Equal    ${lista_valores_coluna_3}                  ${lista_coluna_3}
    Lists Should Be Equal    ${lista_valores_coluna_4}                  ${lista_coluna_4}
    Lists Should Be Equal    ${lista_valores_coluna_5}                  ${lista_coluna_5}
    Lists Should Be Equal    ${lista_valores_coluna_6}                  ${lista_coluna_6}
    Lists Should Be Equal    ${lista_valores_coluna_7}                  ${lista_coluna_7}
    Lists Should Be Equal    ${lista_valores_coluna_8}                  ${lista_coluna_8}
    Lists Should Be Equal    ${lista_valores_coluna_9}                  ${lista_coluna_9}
    Lists Should Be Equal    ${lista_valores_coluna_10}                  ${lista_coluna_10}
    Lists Should Be Equal    ${lista_valores_coluna_11}                  ${lista_coluna_11}
