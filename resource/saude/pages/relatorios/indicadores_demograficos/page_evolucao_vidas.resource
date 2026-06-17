*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Evolução de Vidas
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_indicadores_demograficos_evolucao_vidas}
    
    # Validação
    Wait For Elements State    ${relatorio_indicadores_demograficos_evolucao_vidas_lbl_perfil_populacao}   state=visible
    Wait For Elements State    ${relatorio_indicadores_demograficos_evolucao_vidas_btn_download_csv}    state=visible

Ler arquivo csv - Indicadores Demográficos - Evolução de Vidas
    [Arguments]    ${arquivo} 

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    ${coluna_1}    Create List
    ${coluna_2}    Create List
    ${coluna_3}    Create List

    Remove From List    ${data}    0
    Remove From List    ${data}    0
    Remove From List    ${data}    -1

    FOR      ${user}   IN   @{data}

        Log   ${user}[0]
        Append To List    ${coluna_1}    ${user}[0] 
        Log   ${user}[1]
        Append To List    ${coluna_2}    ${user}[1] 
        

        IF    "${user}[2]" == "${EMPTY}"
            Log    é vazio
            Append To List    ${coluna_3}    - 0,00%
        ELSE
            Log   ${user}[2]
            Append To List    ${coluna_3}    ${user}[2]
        END 
    
    END
    
    # Dados tratados
    Log List    ${coluna_1}
    Log List    ${coluna_2}
    Log List    ${coluna_3}
    
    RETURN    ${coluna_1}    ${coluna_2}    ${coluna_3}

Capturar e Validar tabela Relatório Indicadores Demográficos - Evolução de Vidas
    [Arguments]    ${lista_coluna_1}        ${lista_coluna_2}    ${lista_coluna_3} 

    ${lista_valores_coluna_2}    Create List
    ${lista_valores_coluna_3}    Create List

    ${table}=    Set Variable    xpath=//*[@id="table01"] 

    FOR    ${elemento}    IN    @{lista_coluna_1}
        Log    Procurando por -> ${elemento}

        ${elemento_index}    Get Table Row Index    ${table} >> "${elemento}"

        ${elemento_coluna_2}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[2]
        ${elemento_coluna_3}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[3]
        
        ${valor_vidas}    Get Text    xpath=${elemento_coluna_2}
        ${valor_variacao}    Get Text    xpath=${elemento_coluna_3}

        Append To List     ${lista_valores_coluna_2}    ${valor_vidas}
        Append To List     ${lista_valores_coluna_3}    ${valor_variacao}     
    END

    Lists Should Be Equal    ${lista_coluna_2}   ${lista_valores_coluna_2}
    Lists Should Be Equal    ${lista_coluna_3}   ${lista_valores_coluna_3}
    
    RETURN    ${lista_coluna_2}    ${lista_coluna_3}

Reprocessamento - Demografia - Evolução de Vidas
    [Arguments]     ${_USERNAME}    ${_PASSWORD}    ${_BASE_URL}    ${empresa}

    # Login
    Criar sessão e Login    ${_USERNAME}    ${_PASSWORD}    ${_BASE_URL}

    # Config empresa
    Navegação página Configuração
    Configurar empresa    ${empresa}
    Validar empresa configurada    ${empresa}
    
    # Navegação
    Navegação página Evolução de Vidas
    
    ${zip_file}    Set Variable     ${EXECDIR}/resource/download/demografia_evolucao_populacional.zip    
    ${dir}         Set Variable     ${EXECDIR}/resource/download/demografia
    ${raiz}        Set Variable     ${EXECDIR}/resource/download
    
    # Captura de arquivos
    Fazer Download CSV    ${zip_file}
    Unzip arquivo   ${zip_file}     ${dir}
    
    # # Listando Arquivos
    ${evolucao_populacional_tabela}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=evolucao_populacional_tabela_
    ${evolucao_populacional_grafico}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=evolucao_populacional_grafico_

    # Arquivo Leitura de arquivos
    ${lista_coluna_1}        ${lista_coluna_2}    ${lista_coluna_3}       Ler arquivo csv - Indicadores Demográficos - Evolução de Vidas   arquivo=${dir}/${evolucao_populacional_tabela}

    # Excluir arquivos
    Remove Files    ${dir}/${evolucao_populacional_tabela}
    ...             ${dir}/${evolucao_populacional_grafico}    
    ...             ${zip_file}
    Remove Directory    ${dir}
    Remove Directory    ${raiz}
    
    # Caputa de Tela e validação
    ${lista_valores_ambiente_coluna_2}    ${lista_valores_ambiente_coluna_3}    Capturar e Validar tabela Relatório Indicadores Demográficos - Evolução de Vidas    ${lista_coluna_1}        ${lista_coluna_2}    ${lista_coluna_3} 
    
    Encerrar sessão

    RETURN    ${lista_valores_ambiente_coluna_2}    ${lista_valores_ambiente_coluna_3}