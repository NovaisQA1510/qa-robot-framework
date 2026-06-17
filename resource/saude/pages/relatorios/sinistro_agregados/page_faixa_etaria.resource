*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Faixa Etaria
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_sinistro_agregado_faixa_etaria} 

    
    # Validação
    Wait For Elements State    ${relatorio_sinistro_faixa_etaria_lbl_sinistro_por_faixa_etaria}   state=visible
    Wait For Elements State    ${relatorio_sinistro_faixa_etaria_btn_csv}    state=visible

Ler arquivo csv - Sinistro - Analise - Faixa Etaria
    [Arguments]    ${arquivo}    

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    Remove From List     ${data}              0
    Remove From List     ${data}              0
    Remove From List     ${data}              -1

    ${lista_coluna_1}                 Create List
    ${lista_coluna_2}                 Create List 
    ${lista_coluna_3}                 Create List
    ${lista_coluna_4}                 Create List
    ${lista_coluna_5}                 Create List
    
    FOR      ${elemento}   IN   @{data}

        Append To List    ${lista_coluna_1}                 ${elemento}[0]
        Append To List    ${lista_coluna_2}                 ${elemento}[1]
        Append To List    ${lista_coluna_3}                 ${elemento}[2]
        Append To List    ${lista_coluna_4}                 ${elemento}[3]
        Append To List    ${lista_coluna_5}                 ${elemento}[4]
    END


    RETURN    ${lista_coluna_1}     ${lista_coluna_2}    ${lista_coluna_3}    ${lista_coluna_4}    ${lista_coluna_5}

Capturar e Validar tabela Sinistro Analise - Faixa Etaria
     [Arguments]    ${lista_coluna_1}    ${lista_coluna_2}    ${lista_coluna_3}   ${lista_coluna_4}    ${lista_coluna_5}    

    ${lista_valores_coluna_1}                Create List
    ${lista_valores_coluna_2}                Create List 
    ${lista_valores_coluna_3}                Create List
    ${lista_valores_coluna_4}                Create List
    ${lista_valores_coluna_5}                Create List

    ${table}=    Set Variable    xpath=//*[@id="table01"] 

    FOR    ${elemento}    IN    @{lista_coluna_1}
        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"
        
        ${elemento_2}               Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[2]
        ${elemento_3}               Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[3]
        ${elemento_4}               Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[4]
        ${elemento_5}               Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[5]

        ${valor_coluna2}             Get Text    xpath=${elemento_2}    
        ${valor_coluna3}             Get Text    xpath=${elemento_3}
        ${valor_coluna4}             Get Text    xpath=${elemento_4}  
        ${valor_coluna5}             Get Text    xpath=${elemento_5}  


        Append To List    ${lista_valores_coluna_2}                  ${valor_coluna2}
        Append To List    ${lista_valores_coluna_3}                  ${valor_coluna3}
        Append To List    ${lista_valores_coluna_4}                  ${valor_coluna4}
        Append To List    ${lista_valores_coluna_5}                  ${valor_coluna5}
       
    END

    Lists Should Be Equal    ${lista_valores_coluna_2}                  ${lista_coluna_2}
    Lists Should Be Equal    ${lista_valores_coluna_3}                  ${lista_coluna_3}
    Lists Should Be Equal    ${lista_valores_coluna_4}                  ${lista_coluna_4}
    Lists Should Be Equal    ${lista_valores_coluna_5}                  ${lista_coluna_5}
