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

Validação da Navegação para Relatórios - Sinistros Agregados - Tipo de Evento

    [Tags]    navegacao
    Navegação para Relatórios - Tipo de Evento

Validação da Navegação para Relatórios - Sinistros Agregados - Especialidade
    [Tags]    navegacao
    Navegação para Relatórios - Especialidade


