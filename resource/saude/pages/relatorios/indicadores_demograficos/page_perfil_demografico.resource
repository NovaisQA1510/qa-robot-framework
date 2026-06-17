*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Perfil Demografico
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_indicadores_demograficos_perfil_demografico}
    
    # Validação
    Wait For Elements State    ${relatorio_indicadores_demograficos_perfil_demografico_lbl_perfil_populacao}   state=visible
    Wait For Elements State    ${relatorio_indicadores_demograficos_perfil_demografico_btn_download_csv}    state=visible

Ler arquivo csv - Indicadores Demográficos - Perfil Demografico
    [Arguments]    ${arquivo}    ${modelo}

    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}
    
    IF    "${modelo}" == "2"
        ${coluna_1}    ${coluna_2}    Modelo de 2 colunas    ${data}
        RETURN    ${coluna_1}    ${coluna_2}
    ELSE IF    "${modelo}" == "3"
        ${coluna_1}    ${coluna_2}    ${coluna_3}    Modelo de 3 colunas    ${data}
        RETURN    ${coluna_1}    ${coluna_2}    ${coluna_3}
    END

Modelo de 2 colunas
    [Arguments]    ${data}

    ${coluna_1}    Create List
    ${coluna_2}    Create List
    
    FOR      ${user}   IN   @{data}

        Log   ${user}[0]
        Append To List    ${coluna_1}    ${user}[0] 
        Log   ${user}[1]
        Append To List    ${coluna_2}    ${user}[1]
    
    END

    # Tratamento de dados
    Remove From List    ${coluna_1}    0
    Remove From List    ${coluna_1}    0
    Remove From List    ${coluna_1}    -1

    Remove From List    ${coluna_2}    0
    Remove From List    ${coluna_2}    0
    Remove From List    ${coluna_2}    -1
    
    # Dados tratados
    # Log    ${coluna_1}
    # Log    ${coluna_2}
    
    RETURN    ${coluna_1}    ${coluna_2}    

Modelo de 3 colunas
    [Arguments]    ${data}

    ${coluna_1}    Create List
    ${coluna_2}    Create List
    ${coluna_3}    Create List

    FOR      ${user}   IN   @{data}

        Log   ${user}[0]
        Append To List    ${coluna_1}    ${user}[0] 
        Log   ${user}[1]
        Append To List    ${coluna_2}    ${user}[1] 
        Log   ${user}[2]
        Append To List    ${coluna_3}    ${user}[2] 
    
    END
    
    # Tratamento de dados
    Remove From List    ${coluna_1}    0
    Remove From List    ${coluna_1}    0
    Remove From List    ${coluna_1}    -1

    Remove From List    ${coluna_2}    0
    Remove From List    ${coluna_2}    0
    Remove From List    ${coluna_2}    -1

    Remove From List    ${coluna_3}    0
    Remove From List    ${coluna_3}    0
    Remove From List    ${coluna_3}    -1
    
    # Dados tratados
    Log    ${coluna_1}
    Log    ${coluna_2}
    Log    ${coluna_3}
    
    RETURN    ${coluna_1}    ${coluna_2}    ${coluna_3}

Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Demografico - Faixa etárias
    [Arguments]    ${faixa_etaria}

    FOR    ${elemento}    IN    @{faixa_etaria}
        
        Wait For Elements State    xpath=*//span[@class="fusioncharts-container"]//*[normalize-space(text()) = '${elemento}']    state=visible    

    END

Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Demografico - Genero
    [Arguments]    ${coluna_1_genero}             ${coluna_2_genero}

    # Leitura
    ${mas}          Set Variable    ${coluna_1_genero}[0]
    ${fem}          Set Variable    ${coluna_1_genero}[1]
    ${mas_valor}    Set Variable    ${coluna_2_genero}[0]
    ${fem_valor}    Set Variable    ${coluna_2_genero}[1]
    
    # Cálculo e tratamento Masculino
    ${mas_porcento}    Evaluate   (${mas_valor}/(${mas_valor}+${fem_valor})) * 100
    ${mas_porcento}    Convert To Number    ${mas_porcento}    2
    ${mas_porcento}    Convert To String    ${mas_porcento}
    ${mas_porcento}    Replace String    ${mas_porcento}    .    ,
    Log    ${mas_porcento} 
    
    # Cálculo e tratamento Feminino
    ${fem_porcento}    Evaluate   (${fem_valor}/(${mas_valor}+${fem_valor})) * 100
    ${fem_porcento}    Convert To Number    ${fem_porcento}    2
    ${fem_porcento}    Convert To String    ${fem_porcento}
    ${fem_porcento}    Replace String    ${fem_porcento}    .    ,
    Log    ${fem_porcento} 
    
    # Criação elemento de busca
    ${mas_busca}    Set Variable    ${mas}, ${mas_porcento}%
    ${fem_busca}    Set Variable    ${fem}, ${fem_porcento}%
    
    # Validação
    Wait For Elements State    text=${mas_busca}    state=visible
    Wait For Elements State    text=${fem_busca}    state=visible    

Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Demografico - Indicadores
    [Arguments]    ${indicadores}    ${valor_indicadores}

    ${lista_valores_tabela}    Create List

    FOR    ${elemento}    IN    @{indicadores}
        Log    Procurando por -> ${elemento}

        ${elemento_index}    Get Table Row Index    text=${elemento}
        ${valor_empresa_path}    Set Variable    //*[@id="table01"]/tbody/tr[${elemento_index}]/td[2]
        ${valor_empresa}    Get Text    xpath=${valor_empresa_path}

        Log    ${elemento} -> ${valor_empresa}

        Append To List    ${lista_valores_tabela}      ${valor_empresa}     
    END

    Lists Should Be Equal    ${lista_valores_tabela}    ${valor_indicadores}

    RETURN    ${lista_valores_tabela}

Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Demografico - Titularidade
    [Arguments]    ${coluna_1_titularidade}          ${coluna_2_titularidade}

    # Leitura
    ${tit}          Set Variable    ${coluna_1_titularidade}[0]
    ${dep}          Set Variable    ${coluna_1_titularidade}[1]
    ${tit_valor}    Set Variable    ${coluna_2_titularidade}[0]
    ${dep_valor}    Set Variable    ${coluna_2_titularidade}[1]
    
    # Cálculo e tratamento Masculino
    ${tit_porcento}    Evaluate   (${tit_valor}/(${dep_valor}+${tit_valor})) * 100
    ${tit_porcento}    Convert To Number    ${tit_porcento}    2
    ${tit_porcento}    Convert To String    ${tit_porcento}
    ${tit_porcento}    Replace String    ${tit_porcento}    .    ,
    # Log    ${tit_porcento} 
    
    # Cálculo e tratamento Feminino
    ${dep_porcento}    Evaluate   (${dep_valor}/(${dep_valor}+${tit_valor})) * 100
    ${dep_porcento}    Convert To Number    ${dep_porcento}    2
    ${dep_porcento}    Convert To String    ${dep_porcento}
    ${dep_porcento}    Replace String    ${dep_porcento}    .    ,
    # Log    ${dep_porcento} 
    
    # Criação elemento de busca
    ${tit_busca}    Set Variable    ${tit}, ${tit_porcento}%
    ${dep_busca}    Set Variable    ${dep}, ${dep_porcento}%
    
    # Validação
    Wait For Elements State    text=${tit_busca}    state=visible
    Wait For Elements State    text=${dep_busca}    state=visible

Reprocessamento - Demografia - Perfil Demografico
    [Arguments]     ${_USERNAME}    ${_PASSWORD}    ${_BASE_URL}    ${empresa}

    # Login
    Criar sessão e Login    ${_USERNAME}    ${_PASSWORD}    ${_BASE_URL}

    # Config empresa
    Navegação página Configuração
    Configurar empresa    ${empresa}
    Validar empresa configurada    ${empresa}

    #Navegação
    Navegação página Perfil Demografico

    ${zip_file}    Set Variable     ${EXECDIR}/resource/download/demografia_perfil_populacional.zip    
    ${dir}         Set Variable     ${EXECDIR}/resource/download/demografia
    ${raiz}        Set Variable     ${EXECDIR}/resource/download
    
    # Captura de arquivos
    Fazer Download CSV    ${zip_file}
    Unzip arquivo   ${zip_file}     ${dir}
    
    # # Listando Arquivos
    ${demografico_faixaetaria_TODOS}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=demografico_faixaetaria_TODOS
    ${demografico_genero_TODOS}         Listar arquivos csv    diretorio=${dir}    nome_arquivo=demografico_genero_TODOS
    ${demografico_indicadores_TODOS}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=demografico_indicadores_TODOS
    ${demografico_titularidade}         Listar arquivos csv    diretorio=${dir}    nome_arquivo=demografico_titularidade
    
    # Arquivo Leitura de arquivos
    ${coluna_1_indicadores}        ${coluna_2_indicadores}            Ler arquivo csv - Indicadores Demográficos - Perfil Demografico   arquivo=${dir}/${demografico_indicadores_TODOS}      modelo=2

    # Excluir arquivos
    Remove Files    ${dir}/${demografico_faixaetaria_TODOS}    
    ...             ${dir}/${demografico_genero_TODOS}    
    ...             ${dir}/${demografico_indicadores_TODOS}    
    ...             ${dir}/${demografico_titularidade}
    ...             ${zip_file}
    Remove Directory    ${dir}
    Remove Directory    ${raiz}
    
    # Caputa de Tela e validação
    ${lista_valores_ambiente}    Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Demografico - Indicadores      ${coluna_1_indicadores}        ${coluna_2_indicadores}
    
    Encerrar sessão

    RETURN    ${lista_valores_ambiente}