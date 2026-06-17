*** Settings ***
Resource    ../../../resource/odonto/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Validação da Navegação para Configuração - Relatórios
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa    ${Empresa_2}
    Validar empresa configurada    ${Empresa_2} 

Validação da Navegação para Relatórios Evoluções de Sinistro - Evolução por Plano
    [Tags]    navegacao    
    Navegação para Relatórios - Evolução por Plano 
