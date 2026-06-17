*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Configuração de empresa para Integração
    [Tags]    navegacao    
    Navegação página Configuração
    Configurar empresa    ${Empresa_11}
    Validar empresa configurada    ${Empresa_11} 

Validação da Navegação para Relatórios - Individual - Resumo
    [Tags]    csv    
    Navegação página Individual Resumo

    ${file}    Set Variable        ${EXECDIR}/resource/download/individuaisResumo.csv   
    ${dir}     Set Variable        ${EXECDIR}/resource/download

    # # Captura de arquivos
    Fazer Download CSV    ${file}

     # #Arquivo Leitura de arquivos - Tabela
    ${lista_coluna_1}       ${lista_coluna_2}    ${lista_coluna_3}    
    ...    ${lista_coluna_4}    ${lista_coluna_5}    ${lista_coluna_6}    
    ...    ${lista_coluna_7}    ${lista_coluna_8}    ${lista_coluna_9}    
    ...    ${lista_coluna_10}    ${lista_coluna_11}    
    ...    Ler arquivo csv - Individual - Resumo - Tabela    arquivo=${file}

      # # Excluir arquivos
    Remove Files    ${file}
    Remove Directory    ${dir}

    # Caputa de Tela e validação
    Capturar e Validar tabela Resumo - Individual - Resumo - Tabela    
    ...    ${lista_coluna_1}    ${lista_coluna_2}    ${lista_coluna_3}    
    ...    ${lista_coluna_4}    ${lista_coluna_5}    ${lista_coluna_6}    
    ...    ${lista_coluna_7}    ${lista_coluna_8}    ${lista_coluna_9}    
    ...    ${lista_coluna_10}    ${lista_coluna_11}