*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Evolução Sinistralidade
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_resumo_de_indicadores_evolucao_sinistralidade}
    
    # Validação
    Wait For Elements State    ${relatorio_resumo_de_indicadores_evolucao_sinistralidade_lbl_resumo_financeiro}   state=visible
    Wait For Elements State    ${relatorio_resumo_de_indicadores_evolucao_sinistralidade_btn_download_csv}    state=visible

    # Validação extra para conferir se é um menu de uma empresa de saúde
    Wait For Elements State    ${config_config_lbl_tipo_dado}                                                  state=visible

Ler arquivo csv - Indicadores - Evolução Sinistralidade
    [Arguments]    ${arquivo}    

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    ${data_1}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    Remove From List     ${data}              0
    Remove From List     ${data}             -1
    Remove From List     ${data}             -1
    Remove From List     ${data}             -1

    ${lista_coluna_1}           Create List
    ${lista_coluna_2}           Create List
    ${lista_coluna_3}           Create List
    ${lista_coluna_4}           Create List        
    ${lista_coluna_5}           Create List
    
    FOR      ${elemento}   IN   @{data}

        Append To List    ${lista_coluna_1}          ${elemento}[0]
        Append To List    ${lista_coluna_2}          ${elemento}[1]
        Append To List    ${lista_coluna_3}          ${elemento}[2]
        Append To List    ${lista_coluna_4}          ${elemento}[3]
        Append To List    ${lista_coluna_5}          ${elemento}[4]

    END
    
    # Tratamento de dados adição
    Append To List    ${lista_coluna_1}      TOTAL
    Append To List    ${lista_coluna_2}            ${data_1}[-1][0]
    Append To List    ${lista_coluna_3}            ${data_1}[-1][1]
    Append To List    ${lista_coluna_4}            ${data_1}[-1][2]
    Append To List    ${lista_coluna_5}            ${data_1}[-1][3]
     
    RETURN    ${lista_coluna_1}    ${lista_coluna_2}    ${lista_coluna_3}    ${lista_coluna_4}    ${lista_coluna_5} 

Capturar e Validar tabela Resumo Financeiro - Resumo de Indicadores - Evolução Sinistralidade
    [Arguments]    ${lista_data}    ${lista_premio}    ${lista_sinistro}    ${lista_sinistralidade}    ${lista_copay}

    ${lista_valores_premio}               Create List
    ${lista_valores_sinistro}             Create List
    ${lista_valores_sinistralidade}       Create List
    ${lista_valores_copay}                Create List

    ${table}=    Set Variable    xpath=//*[@id="table01"] 

    FOR    ${elemento}    IN    @{lista_data}
        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"

        ${elemento_premio}            Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[2]
        ${elemento_sinistro}          Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[3]
        ${elemento_copay}             Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[4]
        ${elemento_sinistralidade}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[5]

        ${valor_premio}            Get Text    xpath=${elemento_premio}
        ${valor_sinistro}          Get Text    xpath=${elemento_sinistro}
        ${valor_copay}             Get Text    xpath=${elemento_copay}
        ${valor_sinistralidade}    Get Text    xpath=${elemento_sinistralidade}

        Append To List    ${lista_valores_premio}               ${valor_premio}
        Append To List    ${lista_valores_sinistro}             ${valor_sinistro}
        Append To List    ${lista_valores_sinistralidade}       ${valor_sinistralidade}
        Append To List    ${lista_valores_copay}                ${valor_copay}    
    END

    Lists Should Be Equal    ${lista_valores_premio}              ${lista_premio}
    Lists Should Be Equal    ${lista_valores_sinistro}            ${lista_sinistro}
    Lists Should Be Equal    ${lista_valores_sinistralidade}      ${lista_sinistralidade}
    Lists Should Be Equal    ${lista_valores_copay}               ${lista_copay}

Validação de fórmula Porcentagem Sinistralidade - Evolução Sinistralidade
    [Arguments]    ${lista_coluna_1}
    
    ${lista_sinistralidade_tela}               Create List
    ${lista_sinistralidade_calculado}             Create List

    ${table}=    Set Variable    xpath=//*[@id="table01"] 

    FOR    ${elemento}    IN    @{lista_coluna_1}
        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"

        ${elemento_premio}            Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[2]
        ${elemento_sinistro}          Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[3]
        ${elemento_copay}             Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[4]
        ${elemento_sinistralidade}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[5]

        ${valor_premio}            Get Text    xpath=${elemento_premio}
        ${valor_sinistro}          Get Text    xpath=${elemento_sinistro}
        ${valor_copay}             Get Text    xpath=${elemento_copay}
        ${valor_sinistralidade}    Get Text    xpath=${elemento_sinistralidade}
        
        ${valor_premio}          Replace String    ${valor_premio}          .    ${EMPTY}
        ${valor_premio}          Replace String    ${valor_premio}          .    ${EMPTY}
        ${valor_sinistro}        Replace String    ${valor_sinistro}        .    ${EMPTY}
        ${valor_sinistro}        Replace String    ${valor_sinistro}        .    ${EMPTY}
        ${valor_copay}           Replace String    ${valor_copay}           .    ${EMPTY}
        ${valor_copay}           Replace String    ${valor_copay}           .    ${EMPTY}

        ${valor_sinistralidade}  Replace String    ${valor_sinistralidade}  %    ${EMPTY}

        ${valor_premio}            Replace String    ${valor_premio}          ,    .
        ${valor_sinistro}          Replace String    ${valor_sinistro}        ,    .
        ${valor_copay}             Replace String    ${valor_copay}           ,    .
        ${valor_sinistralidade}    Replace String    ${valor_sinistralidade}  ,    .

        ${valor_premio}            Convert To Number    ${valor_premio}
        ${valor_sinistro}          Convert To Number    ${valor_sinistro}
        ${valor_copay}             Convert To Number    ${valor_copay}
        ${valor_sinistralidade}    Convert To Number    ${valor_sinistralidade}
        
        ${sinistralidade_calculada}    Evaluate    ((${valor_sinistro}-${valor_copay})/(${valor_premio}+${valor_copay}))*100
        

        Append To List    ${lista_sinistralidade_tela}               ${valor_sinistralidade}
        Append To List    ${lista_sinistralidade_calculado}             ${sinistralidade_calculada}  
    END

    Lists Should Be Equal    ${lista_sinistralidade_tela}              ${lista_sinistralidade_calculado}