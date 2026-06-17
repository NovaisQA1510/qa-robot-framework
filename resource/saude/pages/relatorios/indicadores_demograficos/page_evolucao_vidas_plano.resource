*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Evolução de Vidas por Plano
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_indicadores_demograficos_evolucao_vidas_plano}
    
    # Validação
    Wait For Elements State    ${relatorio_indicadores_demograficos_evolucao_vidas_plano_lbl_evolucao_vidas}   state=visible
    Wait For Elements State    ${relatorio_indicadores_demograficos_evolucao_vidas_plano_btn_download_csv}    state=visible

Ler arquivo csv - Indicadores Demográficos - Evolução Vidas por Plano
    [Arguments]    ${arquivo}

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    Remove From List     ${data}              0
    Remove From List     ${data}              0

    ${lista_coluna_1}       Create List
    ${lista_coluna_2}       Create List
    ${lista_coluna_3}       Create List
    ${lista_coluna_4}       Create List
    ${lista_coluna_5}       Create List
    ${lista_coluna_6}       Create List 
    ${lista_coluna_7}      Create List  
    ${lista_coluna_8}      Create List
    ${lista_coluna_9}      Create List 
    ${lista_coluna_10}       Create List    
    ${lista_coluna_11}       Create List 
    ${lista_coluna_12}       Create List
    ${lista_coluna_13}       Create List 
    
    FOR      ${elemento}   IN   @{data}
        Append To List    ${lista_coluna_1}        ${elemento}[0]
        Append To List    ${lista_coluna_2}       ${elemento}[1]
        Append To List    ${lista_coluna_3}       ${elemento}[2]
        Append To List    ${lista_coluna_4}       ${elemento}[3]
        Append To List    ${lista_coluna_5}       ${elemento}[4]
        Append To List    ${lista_coluna_6}       ${elemento}[5]
        Append To List    ${lista_coluna_7}       ${elemento}[6]
        Append To List    ${lista_coluna_8}      ${elemento}[7]  
        Append To List    ${lista_coluna_9}      ${elemento}[8]
        Append To List    ${lista_coluna_10}      ${elemento}[9] 
        Append To List    ${lista_coluna_11}       ${elemento}[10]    
        Append To List    ${lista_coluna_12}       ${elemento}[11] 
        Append To List    ${lista_coluna_13}       ${elemento}[12]

    END
     
    RETURN    ${lista_coluna_1}        ${lista_coluna_2}       ${lista_coluna_3}       ${lista_coluna_4}       
    ...    ${lista_coluna_5}    ${lista_coluna_6}       ${lista_coluna_7}    ${lista_coluna_8}
    ...    ${lista_coluna_9}     ${lista_coluna_10}     ${lista_coluna_11}     ${lista_coluna_12}
    ...    ${lista_coluna_13}          

Capturar e Validar tabela Resumo Financeiro - Indicadores Demográficos - Evolução Vidas por Plano
    [Arguments]    ${lista_coluna_1}        ${lista_coluna_2}       ${lista_coluna_3}       ${lista_coluna_4}       
    ...    ${lista_coluna_5}    ${lista_coluna_6}       ${lista_coluna_7}    ${lista_coluna_8}
    ...    ${lista_coluna_9}     ${lista_coluna_10}     ${lista_coluna_11}     ${lista_coluna_12}
    ...    ${lista_coluna_13}

    ${lista_coluna_valores_2}       Create List
    ${lista_coluna_valores_3}       Create List
    ${lista_coluna_valores_4}       Create List
    ${lista_coluna_valores_5}       Create List
    ${lista_coluna_valores_6}       Create List 
    ${lista_coluna_valores_7}      Create List  
    ${lista_coluna_valores_8}      Create List
    ${lista_coluna_valores_9}      Create List 
    ${lista_coluna_valores_10}       Create List    
    ${lista_coluna_valores_11}       Create List 
    ${lista_coluna_valores_12}       Create List
    ${lista_coluna_valores_13}       Create List

    ${table}=    Set Variable    xpath=//*[@id="table01"] 

    FOR    ${elemento}    IN    @{lista_coluna_1}
        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"

        ${elemento_col_2}               Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[2]
        ${elemento_col_3}             Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[3]
        ${elemento_col_4}                Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[4]
        ${elemento_col_5}       Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[5]
        ${elemento_col_6}                Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[6] 
        ${elemento_col_7}     Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[7]  
        ${elemento_col_8}       Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[8]
        ${elemento_col_9}        Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[9] 
        ${elemento_col_10}       Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[10]    
        ${elemento_col_11}           Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[11] 
        ${elemento_col_12}        Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[12]
        ${elemento_col_13}        Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[13]
         
        ${valor_2}             Get Text    xpath=${elemento_col_2}
        ${valor_3}                Get Text    xpath=${elemento_col_3}
        ${valor_4}       Get Text    xpath=${elemento_col_4}
        ${valor_5}                Get Text    xpath=${elemento_col_5}
        ${valor_6}     Get Text    xpath=${elemento_col_6}  
        ${valor_7}       Get Text    xpath=${elemento_col_7}
        ${valor_8}        Get Text    xpath=${elemento_col_8} 
        ${valor_9}       Get Text    xpath=${elemento_col_9}    
        ${valor_10}           Get Text    xpath=${elemento_col_10} 
        ${valor_11}        Get Text    xpath=${elemento_col_11}
        ${valor_12}        Get Text    xpath=${elemento_col_12}
        ${valor_13}               Get Text    xpath=${elemento_col_13}

        Append To List    ${lista_coluna_valores_2}     ${valor_2}
        Append To List    ${lista_coluna_valores_3}     ${valor_3}
        Append To List    ${lista_coluna_valores_4}     ${valor_4}
        Append To List    ${lista_coluna_valores_5}     ${valor_5}
        Append To List    ${lista_coluna_valores_6}     ${valor_6}
        Append To List    ${lista_coluna_valores_7}     ${valor_7}
        Append To List    ${lista_coluna_valores_8}     ${valor_8}
        Append To List    ${lista_coluna_valores_9}     ${valor_9}
        Append To List    ${lista_coluna_valores_10}    ${valor_10}
        Append To List    ${lista_coluna_valores_11}    ${valor_11}
        Append To List    ${lista_coluna_valores_12}    ${valor_12}
        Append To List    ${lista_coluna_valores_13}    ${valor_13}
    END

    Lists Should Be Equal    ${lista_coluna_valores_2}            ${lista_coluna_valores_2}
    Lists Should Be Equal    ${lista_coluna_valores_3}            ${lista_coluna_valores_3}
    Lists Should Be Equal    ${lista_coluna_valores_4}            ${lista_coluna_valores_4}
    Lists Should Be Equal    ${lista_coluna_valores_5}            ${lista_coluna_valores_5}
    Lists Should Be Equal    ${lista_coluna_valores_6}            ${lista_coluna_valores_6}
    Lists Should Be Equal    ${lista_coluna_valores_7}            ${lista_coluna_valores_7}
    Lists Should Be Equal    ${lista_coluna_valores_8}            ${lista_coluna_valores_8}
    Lists Should Be Equal    ${lista_coluna_valores_9}            ${lista_coluna_valores_9}
    Lists Should Be Equal    ${lista_coluna_valores_10}            ${lista_coluna_valores_10}
    Lists Should Be Equal    ${lista_coluna_valores_11}            ${lista_coluna_valores_11}
    Lists Should Be Equal    ${lista_coluna_valores_12}            ${lista_coluna_valores_12}
    Lists Should Be Equal    ${lista_coluna_valores_13}            ${lista_coluna_valores_13}

    RETURN    ${lista_coluna_valores_2}       ${lista_coluna_valores_3}       ${lista_coluna_valores_4}       
    ...    ${lista_coluna_valores_5}    ${lista_coluna_valores_6}       ${lista_coluna_valores_7}    ${lista_coluna_valores_8}
    ...    ${lista_coluna_valores_9}     ${lista_coluna_valores_10}     ${lista_coluna_valores_11}     ${lista_coluna_valores_12}
    ...    ${lista_coluna_valores_13}

Reprocessamento - Demografia - Evolução de Vidas por Plano
    [Arguments]     ${_USERNAME}    ${_PASSWORD}    ${_BASE_URL}    ${empresa}

    # Login
    Criar sessão e Login    ${_USERNAME}    ${_PASSWORD}    ${_BASE_URL}

    # Config empresa
    Navegação página Configuração
    Configurar empresa    ${empresa}
    Validar empresa configurada    ${empresa}
    
    # Navegação
    Navegação página Evolução de Vidas por Plano

    ${file}    Set Variable        ${EXECDIR}/resource/download/evolucao_vidas_plano.csv   
    ${dir}     Set Variable        ${EXECDIR}/resource/download
    
    # Captura de arquivos
    Fazer Download CSV    ${file}    
        
    # Arquivo Leitura de arquivos
    ${lista_coluna_1}        ${lista_coluna_2}       ${lista_coluna_3}       ${lista_coluna_4}       
    ...    ${lista_coluna_5}    ${lista_coluna_6}       ${lista_coluna_7}    ${lista_coluna_8}
    ...    ${lista_coluna_9}     ${lista_coluna_10}     ${lista_coluna_11}     ${lista_coluna_12}
    ...    ${lista_coluna_13}        Ler arquivo csv - Indicadores Demográficos - Evolução Vidas por Plano   arquivo=${file}

    # Excluir arquivos
    Remove Files    ${file}
    Remove Directory    ${dir}
    
    # Caputa de Tela e validação
    ${lista_coluna_valores_2}       ${lista_coluna_valores_3}       ${lista_coluna_valores_4}       
    ...    ${lista_coluna_valores_5}    ${lista_coluna_valores_6}       ${lista_coluna_valores_7}    ${lista_coluna_valores_8}
    ...    ${lista_coluna_valores_9}     ${lista_coluna_valores_10}     ${lista_coluna_valores_11}     ${lista_coluna_valores_12}
    ...    ${lista_coluna_valores_13}    
    ...    Capturar e Validar tabela Resumo Financeiro - Indicadores Demográficos - Evolução Vidas por Plano    ${lista_coluna_1}        ${lista_coluna_2}       ${lista_coluna_3}       ${lista_coluna_4}       
    ...    ${lista_coluna_5}    ${lista_coluna_6}       ${lista_coluna_7}    ${lista_coluna_8}
    ...    ${lista_coluna_9}     ${lista_coluna_10}     ${lista_coluna_11}     ${lista_coluna_12}
    ...    ${lista_coluna_13}
        
    Encerrar sessão

    RETURN    ${lista_coluna_valores_2}       ${lista_coluna_valores_3}       ${lista_coluna_valores_4}       
    ...    ${lista_coluna_valores_5}    ${lista_coluna_valores_6}       ${lista_coluna_valores_7}    ${lista_coluna_valores_8}
    ...    ${lista_coluna_valores_9}     ${lista_coluna_valores_10}     ${lista_coluna_valores_11}     ${lista_coluna_valores_12}
    ...    ${lista_coluna_valores_13} 