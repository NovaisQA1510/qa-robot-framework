*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Resumo Indicadores Gerais
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_resumo_de_indicadores_Gerais} 
    
    # Validação
    Wait For Elements State    ${relatorio_resumo_de_indicadores_gerais_lbl_resumo_geral}   state=visible
    Wait For Elements State    ${relatorio_resumo_de_indicadores_gerais_btn_download_csv}    state=visible



Ler arquivo csv - Indicadores Gerais - 3 Colunas
    [Arguments]    ${arquivo}    ${validador} 

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    Remove From List     ${data}              0
    Remove From List     ${data}              0

    IF    "${validador}"== "${True}"
        Remove From List     ${data}              -1

    END


    ${lista_coluna_1}                 Create List
    ${lista_coluna_2}                 Create List 
    ${lista_coluna_3}                 Create List
    
    
    FOR      ${elemento}   IN   @{data}

        Append To List    ${lista_coluna_1}                 ${elemento}[0]
        Append To List    ${lista_coluna_2}                 ${elemento}[1]
        Append To List    ${lista_coluna_3}                 ${elemento}[2]

    END
     
    RETURN    ${lista_coluna_1}       ${lista_coluna_2}    ${lista_coluna_3}             

Ler arquivo csv - Indicadores Gerais - 2 Colunas
    [Arguments]    ${arquivo}   ${validador} 

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    Remove From List     ${data}              0
    Remove From List     ${data}              0

    IF    "${validador}"== "${True}"
        Remove From List     ${data}              -1

    END


    ${lista_coluna_1}                 Create List
    ${lista_coluna_2}                 Create List 
    
    
    FOR      ${elemento}   IN   @{data}

        Append To List    ${lista_coluna_1}                 ${elemento}[0]
        Append To List    ${lista_coluna_2}                 ${elemento}[1]

    END
     
    RETURN    ${lista_coluna_1}       ${lista_coluna_2}                 


Capturar e Validar tabela - Resumo de Indicadores - Gerais - 2 Colunas
    [Arguments]    ${lista_coluna_1}    ${lista_coluna_2}   ${table_id}  

    ${lista_valores_coluna_1}                 Create List
    ${lista_valores_coluna_2}                 Create List 

    ${table}=    Set Variable    xpath=//*[@id="${table_id}"] 

    FOR    ${elemento}    IN    @{lista_coluna_1}
        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"

        ${elemento_index}    Evaluate    ${elemento_index}-1
        
        ${elemento_2}                Set Variable    ${table}/tbody/tr[${elemento_index}]/td[2]
        
        ${valor_coluna_2}                Get Text    ${elemento_2}    
       
        Append To List    ${lista_valores_coluna_2}                    ${valor_coluna_2}
       
    END

    Lists Should Be Equal    ${lista_valores_coluna_2}                    ${lista_coluna_2}


Capturar e Validar tabela - Resumo de Indicadores - Gerais - 3 Colunas
    [Arguments]    ${lista_coluna_1}    ${lista_coluna_2}    ${lista_coluna_3}      ${table_id}  

    ${lista_valores_coluna_1}                 Create List
    ${lista_valores_coluna_2}                 Create List 
    ${lista_valores_coluna_3}                 Create List 

    ${table}=    Set Variable    //*[@id="${table_id}"] 

    FOR    ${elemento}    IN    @{lista_coluna_1}
        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"
        ${elemento_index}    Evaluate    ${elemento_index}-1
        
        ${elemento_2}                Set Variable    ${table}/tbody/tr[${elemento_index}]/td[2]
        ${elemento_3}                Set Variable    ${table}/tbody/tr[${elemento_index}]/td[3]


        ${valor_coluna_2}                Get Text    xpath=${elemento_2}    
        ${valor_coluna_3}                Get Text    xpath=${elemento_3}    

        Append To List    ${lista_valores_coluna_2}                    ${valor_coluna_2}
        Append To List    ${lista_valores_coluna_3}                    ${valor_coluna_3}


    END

    Lists Should Be Equal    ${lista_valores_coluna_2}                    ${lista_coluna_2}
    Lists Should Be Equal    ${lista_valores_coluna_3}                    ${lista_coluna_3}
