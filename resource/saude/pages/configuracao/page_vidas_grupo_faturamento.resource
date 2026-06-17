*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Vidas Por Grupo de Faturamento
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_vidas}
    
    # Validação
    Wait For Elements State    ${config_vidas_lbl_vidas_faturamento}   state=visible
    Wait For Elements State    ${config_vidas_btn_csv}    state=visible
    Wait For Elements State    ${erro_CDbException}    state=detached
    Wait For Elements State    ${erro_php_traces}    state=detached

Validação de Empresa Existente em: Configuração - Vidas por Grupo de Faturamento
    [Arguments]    ${status}    ${empresa}

    Click    ${config_vidas_ddl_selecionar_empresa}
    Click    ${config_vidas_ddl_selecionar_todas_empresas}
    Click    ${config_vidas_btn_enviar}       
    Sleep    5s

    Validar empresa existente tabela: Configuração - Vidas por Grupo de Faturamento    ${status}    ${empresa}

    Validar empresa existente csv: Configuração - Vidas por Grupo de Faturamento    ${status}    ${empresa}  

Validar empresa existente tabela: Configuração - Vidas por Grupo de Faturamento
    [Arguments]    ${status}    ${empresa}

    IF    "${status}" == "True"
        ${empresa_encontrada}    Get Element By Role    role=ROW    all_elements=True    name=${empresa.empresa}
        Should Not Be Empty    ${empresa_encontrada}

        ${empresa_encontrada_type}    Evaluate    type(${empresa_encontrada})

        IF    "${empresa_encontrada_type}" == "<class 'list'>"
            Should Contain    ${empresa_encontrada}[0]    ${empresa.empresa}
            Log To Console    \n${empresa.empresa} existe nas tabelas - VALIDADO COM SUCESSO (Vidas por Grupo de Faturamento)
        ELSE
            Should Contain    ${empresa_encontrada}    ${empresa.empresa}
            Log To Console    \n${empresa.empresa} existe nas tabelas - VALIDADO COM SUCESSO (Vidas por Grupo de Faturamento)
        END

    ELSE 
        ${empresa_encontrada}    Get Element By Role    role=ROW    all_elements=True    name=${empresa.empresa}
        Should Be Empty    ${empresa_encontrada}

        Log To Console    \n${empresa.empresa} não existe nas tabelas - VALIDADO COM SUCESSO (Vidas por Grupo de Faturamento)
    END

Validar empresa existente csv: Configuração - Vidas por Grupo de Faturamento
    [Arguments]    ${status}    ${empresa}

    ${arquivo}    Set Variable        ${EXECDIR}/resource/download/csv_vidas_grupo_faturamento.csv   
    ${dir}     Set Variable        ${EXECDIR}/resource/download
    
    # Captura de arquivos
    Fazer Download CSV    ${arquivo}

    # Arquivo Leitura de arquivos - Tabela
    ${data}    Read Csv File To List    filename=${arquivo}    delimiter=;
    Log List    ${data}

    Remove From List     ${data}              0
    Remove From List     ${data}              0
    Remove From List     ${data}              -1

    ${lista_coluna_2}                 Create List 
    
    FOR      ${elemento}   IN   @{data}
        Append To List    ${lista_coluna_2}                 ${elemento}[1]
    END

    Log List    ${lista_coluna_2}

    # Excluir arquivos
    Remove Files    ${arquivo}
    Remove Directory    ${dir}
    
    IF    "${status}" == "True"
        List Should Contain Value    ${lista_coluna_2}        ${empresa.empresa}
        Log To Console    \n${empresa.empresa} não existe no CSV - VALIDADO COM SUCESSO (Vidas por Grupo de Faturamento)
    ELSE 
        List Should Not Contain Value    ${lista_coluna_2}        ${empresa.empresa}
        Log To Console    \n${empresa.empresa} não existe no CSV - VALIDADO COM SUCESSO (Vidas por Grupo de Faturamento)
    END