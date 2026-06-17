*** Settings ***
Resource    ../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Configuração de empresa para Integração
    [Tags]    navegacao    not_ready
    Navegação página Configuração
    Configurar empresa    ${Empresa_10}
    Validar empresa configurada    ${Empresa_10} 

Validação da Navegação para Integração + API Power BI
    [Tags]    navegacao   not_ready 
    Navegação página Integração
    Validação e Capture Plano de Saúde Dentro do Iframe
    