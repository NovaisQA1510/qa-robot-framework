*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Sinistro por Subestipulante
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_resumo_de_indicadores_sinistro_por_subestipulante}
    
    # Validação
    Wait For Elements State    ${relatorio_resumo_de_indicadores_sinistro_por_subestipulante_lbl_financeiro_subestipulante}   state=visible
    Wait For Elements State    ${relatorio_resumo_de_indicadores_sinistro_por_subestipulante_btn_download_csv}    state=visible

Ler arquivo csv - Resumo de Indicadores - Sinistro por Subestipulante
    [Arguments]    ${arquivo}    

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    Remove From List     ${data}              0
    Remove From List     ${data}              0
    Remove From List     ${data}              -2

    ${lista_coluna_1}                 Create List
    ${lista_coluna_2}                 Create List 
    ${lista_coluna_3}                 Create List
    ${lista_coluna_4}                 Create List

    FOR      ${elemento}   IN   @{data}

        Append To List    ${lista_coluna_1}                 ${elemento}[0]
        Append To List    ${lista_coluna_2}                 ${elemento}[1]
        Append To List    ${lista_coluna_3}                 ${elemento}[2]
        Append To List    ${lista_coluna_4}                 ${elemento}[3]
    END

    RETURN    ${lista_coluna_1}      ${lista_coluna_2}     ${lista_coluna_3}      ${lista_coluna_4}

Capturar e Validar tabela Resumo de Indicadores - Sinistro por Subestipulante
    [Arguments]    ${lista_coluna_1}    ${lista_coluna_2}    ${lista_coluna_3}   ${lista_coluna_4} 

    ${lista_valores_coluna_1}                Create List
    ${lista_valores_coluna_2}                Create List 
    ${lista_valores_coluna_3}                Create List
    ${lista_valores_coluna_4}                Create List
    
    ${table}=    Set Variable    xpath=//*[@id="table01"] 

    FOR    ${elemento}    IN    @{lista_coluna_1}
        Log    Procurando por -> ${elemento}
        
        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"
        
        ${elemento_2}               Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[2]
        ${elemento_3}               Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[3]
        ${elemento_4}               Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[4]
        
        ${valor_coluna2}                Get Text    xpath=${elemento_2}    
        ${valor_coluna3}             Get Text    xpath=${elemento_3}
        ${valor_coluna4}              Get Text    xpath=${elemento_4}  
       
        Append To List    ${lista_valores_coluna_2}                  ${valor_coluna2}
        Append To List    ${lista_valores_coluna_3}                  ${valor_coluna3}
        Append To List    ${lista_valores_coluna_4}                  ${valor_coluna4}
       
    END

    Lists Should Be Equal    ${lista_valores_coluna_2}                  ${lista_coluna_2}
    Lists Should Be Equal    ${lista_valores_coluna_3}                  ${lista_coluna_3}
    Lists Should Be Equal    ${lista_valores_coluna_4}                  ${lista_coluna_4}