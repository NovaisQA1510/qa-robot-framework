*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Evolução Sinistro
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_resumo_de_indicadores_evolucao_sinistro}
    
    # Validação
    Wait For Elements State    ${relatorio_resumo_de_indicadores_evolucao_sinistro_lbl_resumo_financeiro}   state=visible
    Wait For Elements State    ${relatorio_resumo_de_indicadores_evolucao_sinistro_btn_download_csv}    state=visible

Ler arquivo csv - Indicadores - Evolução Sinistro
    [Arguments]    ${arquivo}    

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    Remove From List     ${data}              0
    Remove From List     ${data}              -1
    Remove From List     ${data}              -1
    Remove From List     ${data}              -1


    ${lista_data}                 Create List
    ${lista_vidas}                Create List 
    ${lista_sinistro}             Create List
    ${lista_per_cap}              Create List
    
    
    FOR      ${elemento}   IN   @{data}

        Append To List    ${lista_data}                 ${elemento}[0]
        Append To List    ${lista_vidas}                ${elemento}[1]
        Append To List    ${lista_sinistro}             ${elemento}[2]
        Append To List    ${lista_per_cap}              ${elemento}[3]

    END
     
    RETURN    ${lista_data}       ${lista_vidas}    ${lista_sinistro}    ${lista_per_cap}          

Capturar e Validar tabela Resumo Financeiro - Resumo de Indicadores - Evolução Sinistro
    [Arguments]    ${lista_data}    ${lista_vidas}    ${lista_sinistro}   ${lista_per_cap} 



    ${lista_valores_data}                 Create List
    ${lista_valores_vidas}                Create List 
    ${lista_valores_sinistro}             Create List
    ${lista_valores_per_cap}               Create List
    
    

    ${table}=    Set Variable    xpath=//*[@id="table01"] 

    FOR    ${elemento}    IN    @{lista_data}
        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"
        
        ${elemento_vidas}                Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[2]
        ${elemento_sinistro}             Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[3]
        ${elemento_per_cap}               Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[4]
        

        ${valor_vidas}                Get Text    xpath=${elemento_vidas}    
        ${valor_sinistro}             Get Text    xpath=${elemento_sinistro}
        ${valor_per_cap}              Get Text    xpath=${elemento_per_cap}  
       

        Append To List    ${lista_valores_vidas}                    ${valor_vidas}
        Append To List    ${lista_valores_sinistro}                 ${valor_sinistro}
        Append To List    ${lista_valores_per_cap}                  ${valor_per_cap}
       
    END

    Lists Should Be Equal    ${lista_valores_vidas}                    ${lista_vidas}
    Lists Should Be Equal    ${lista_valores_sinistro}                 ${lista_sinistro}
    Lists Should Be Equal    ${lista_valores_per_cap}                  ${lista_per_cap}

Validação de fórmula Sinistro Per capita - Evolução do Sinistro
    [Arguments]    ${lista_coluna_1}

    ${lista_per_capita_tela}               Create List
    ${lista_per_capita_calculado}          Create List

    ${table}=    Set Variable    xpath=//*[@id="table01"] 

    FOR    ${elemento}    IN    @{lista_coluna_1}
        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"

        ${elemento_vidas}            Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[2]
        ${elemento_sinistro}         Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[3]
        ${elemento_per_capita}       Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[4]

        ${valor_vidas}            Get Text    xpath=${elemento_vidas}
        ${valor_sinistro}          Get Text    xpath=${elemento_sinistro}
        ${valor_per_capita}             Get Text    xpath=${elemento_per_capita}
        
        ${valor_vidas}                Replace String    ${valor_vidas}           .    ${EMPTY}
        ${valor_vidas}                Replace String    ${valor_vidas}           .    ${EMPTY}
        ${valor_sinistro}             Replace String    ${valor_sinistro}        .    ${EMPTY}
        ${valor_sinistro}             Replace String    ${valor_sinistro}        .    ${EMPTY}
        ${valor_per_capita}           Replace String    ${valor_per_capita}      .    ${EMPTY}
        ${valor_per_capita}           Replace String    ${valor_per_capita}      .    ${EMPTY}


        ${valor_vidas}            Replace String    ${valor_vidas}           ,    .
        ${valor_sinistro}         Replace String    ${valor_sinistro}        ,    .
        ${valor_per_capita}       Replace String    ${valor_per_capita}      ,    .

        ${valor_vidas}            Convert To Number    ${valor_vidas}
        ${valor_sinistro}          Convert To Number    ${valor_sinistro}
        ${valor_per_capita}             Convert To Number    ${valor_per_capita}
        
        ${per_capita_calculada}    Evaluate    ${valor_sinistro}/${valor_vidas}
        ${per_capita_calculada}    Convert To Number    ${per_capita_calculada}    2

        Append To List    ${lista_per_capita_tela}               ${valor_per_capita}
        Append To List    ${lista_per_capita_calculado}          ${per_capita_calculada}  
    END

    Lists Should Be Equal    ${lista_per_capita_tela}              ${lista_per_capita_calculado}
