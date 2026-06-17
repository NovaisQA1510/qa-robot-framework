*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Evolução Sinistralidade - Detalhado
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_resumo_de_indicadores_evolucao_sinistralidade_detalhado}
    
    # Validação
    Wait For Elements State    ${relatorio_resumo_de_indicadores_evolucao_sinistralidade_detalhado_lbl_resumo_financeiro}   state=visible
    Wait For Elements State    ${relatorio_resumo_de_indicadores_evolucao_sinistralidade_detalhado_btn_download_csv}    state=visible

Ler arquivo csv - Indicadores - Evolução Sinistralidade - Detalhado
    [Arguments]    ${arquivo}    

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    Remove From List     ${data}              0
    Remove From List     ${data}              0

    ${lista_data}                 Create List
    ${lista_premio}               Create List
    ${lista_sinistro}             Create List
    ${lista_copay}                Create List
    ${lista_sinistralidade}       Create List
    ${lista_vidas}                Create List 
    ${lista_sinistro_per_cap}     Create List  
    ${lista_premio_per_cap}       Create List
    ${lista_copay_per_cap}        Create List 
    ${lista_lim_tec_mensal}       Create List    
    ${lista_exc_mensal}           Create List 
    ${lista_exc_acumulado}        Create List  
    
    FOR      ${elemento}   IN   @{data}
        Append To List    ${lista_data}                 ${elemento}[0]
        Append To List    ${lista_premio}               ${elemento}[1]
        Append To List    ${lista_sinistro}             ${elemento}[2]
        Append To List    ${lista_copay}                ${elemento}[3]
        Append To List    ${lista_sinistralidade}       ${elemento}[4]
        Append To List    ${lista_vidas}                ${elemento}[5] 
        Append To List    ${lista_sinistro_per_cap}     ${elemento}[6]  
        Append To List    ${lista_premio_per_cap}       ${elemento}[7]
        Append To List    ${lista_copay_per_cap}        ${elemento}[8] 
        Append To List    ${lista_lim_tec_mensal}       ${elemento}[9]    
        Append To List    ${lista_exc_mensal}           ${elemento}[10] 
        Append To List    ${lista_exc_acumulado}        ${elemento}[11]
    END
     
    RETURN    ${lista_data}    ${lista_premio}    ${lista_sinistro}    ${lista_copay}    ${lista_sinistralidade}    ${lista_vidas}    ${lista_sinistro_per_cap}    ${lista_premio_per_cap}    ${lista_copay_per_cap}    ${lista_lim_tec_mensal}    ${lista_exc_mensal}    ${lista_exc_acumulado}     

Capturar e Validar tabela Resumo Financeiro - Resumo de Indicadores - Evolução Sinistralidade - Detalhado
    [Arguments]    ${lista_data}    ${lista_premio}    
    ...    ${lista_sinistro}    ${lista_copay}    
    ...    ${lista_sinistralidade}    ${lista_vidas}    
    ...    ${lista_sinistro_per_cap}    ${lista_premio_per_cap}    
    ...    ${lista_copay_per_cap}    ${lista_lim_tec_mensal}    
    ...    ${lista_exc_mensal}    ${lista_exc_acumulado} 

    ${lista_valores_data}                 Create List
    ${lista_valores_premio}               Create List
    ${lista_valores_sinistro}             Create List
    ${lista_valores_copay}                Create List
    ${lista_valores_sinistralidade}       Create List
    ${lista_valores_vidas}                Create List 
    ${lista_valores_sinistro_per_cap}     Create List  
    ${lista_valores_premio_per_cap}       Create List
    ${lista_valores_copay_per_cap}        Create List 
    ${lista_valores_lim_tec_mensal}       Create List    
    ${lista_valores_exc_mensal}           Create List 
    ${lista_valores_exc_acumulado}        Create List

    ${table}=    Set Variable    xpath=//*[@id="table01"] 

    FOR    ${elemento}    IN    @{lista_data}
        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"

        ${elemento_premio}               Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[2]
        ${elemento_sinistro}             Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[3]
        ${elemento_copay}                Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[4]
        ${elemento_sinistralidade}       Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[5]
        ${elemento_vidas}                Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[6] 
        ${elemento_sinistro_per_cap}     Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[7]  
        ${elemento_premio_per_cap}       Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[8]
        ${elemento_copay_per_cap}        Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[9] 
        ${elemento_lim_tec_mensal}       Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[10]    
        ${elemento_exc_mensal}           Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[11] 
        ${elemento_exc_acumulado}        Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[12]

        ${valor_premio}               Get Text    xpath=${elemento_premio}     
        ${valor_sinistro}             Get Text    xpath=${elemento_sinistro}
        ${valor_copay}                Get Text    xpath=${elemento_copay}
        ${valor_sinistralidade}       Get Text    xpath=${elemento_sinistralidade}
        ${valor_vidas}                Get Text    xpath=${elemento_vidas}
        ${valor_sinistro_per_cap}     Get Text    xpath=${elemento_sinistro_per_cap}  
        ${valor_premio_per_cap}       Get Text    xpath=${elemento_premio_per_cap}
        ${valor_copay_per_cap}        Get Text    xpath=${elemento_copay_per_cap} 
        ${valor_lim_tec_mensal}       Get Text    xpath=${elemento_lim_tec_mensal}    
        ${valor_exc_mensal}           Get Text    xpath=${elemento_exc_mensal} 
        ${valor_exc_acumulado}        Get Text    xpath=${elemento_exc_acumulado}

        Append To List    ${lista_valores_premio}                   ${valor_premio}
        Append To List    ${lista_valores_sinistro}                 ${valor_sinistro}
        Append To List    ${lista_valores_copay}                    ${valor_copay}
        Append To List    ${lista_valores_sinistralidade}           ${valor_sinistralidade}
        Append To List    ${lista_valores_vidas}                    ${valor_vidas}
        Append To List    ${lista_valores_sinistro_per_cap}         ${valor_sinistro_per_cap}
        Append To List    ${lista_valores_premio_per_cap}           ${valor_premio_per_cap}
        Append To List    ${lista_valores_copay_per_cap}            ${valor_copay_per_cap}
        Append To List    ${lista_valores_lim_tec_mensal}           ${valor_lim_tec_mensal}   
        Append To List    ${lista_valores_exc_mensal}               ${valor_exc_mensal}
        Append To List    ${lista_valores_exc_acumulado}            ${valor_exc_acumulado}
    END

    Lists Should Be Equal    ${lista_valores_premio}                   ${lista_premio}
    Lists Should Be Equal    ${lista_valores_sinistro}                 ${lista_sinistro}
    Lists Should Be Equal    ${lista_valores_copay}                    ${lista_copay}
    Lists Should Be Equal    ${lista_valores_sinistralidade}           ${lista_sinistralidade}
    Lists Should Be Equal    ${lista_valores_vidas}                    ${lista_vidas}
    Lists Should Be Equal    ${lista_valores_sinistro_per_cap}         ${lista_sinistro_per_cap}
    Lists Should Be Equal    ${lista_valores_premio_per_cap}           ${lista_premio_per_cap}
    Lists Should Be Equal    ${lista_valores_copay_per_cap}            ${lista_copay_per_cap}
    Lists Should Be Equal    ${lista_valores_lim_tec_mensal}           ${lista_lim_tec_mensal}   
    Lists Should Be Equal    ${lista_valores_exc_mensal}               ${lista_exc_mensal}
    Lists Should Be Equal    ${lista_valores_exc_acumulado}            ${lista_exc_acumulado}
