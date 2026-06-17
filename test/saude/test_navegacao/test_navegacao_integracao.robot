*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Configuração de empresa para Integração
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa    ${Empresa_5}
    Validar empresa configurada    ${Empresa_5} 

Validação da Navegação para Integração
    [Tags]    navegacao
    Navegação página Integração