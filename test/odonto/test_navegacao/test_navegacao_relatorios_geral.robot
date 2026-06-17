*** Settings ***
Resource    ../../../resource/odonto/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Validação da Navegação para Configuração - Relatórios
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa    ${Empresa_1}
    Validar empresa configurada    ${Empresa_1} 

Validação da Navegação para Relatórios Prestadores - Geral
    [Tags]    navegacao
    Navegação para Relatórios - Geral  

