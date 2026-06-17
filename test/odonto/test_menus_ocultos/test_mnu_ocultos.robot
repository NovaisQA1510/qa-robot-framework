*** Settings ***
Resource    ../../../resource/odonto/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Validação da Navegação para Configuração - Configuração
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa    ${Empresa_1}
    Validar empresa configurada    ${Empresa_1} 

Navegação e Validação Menu Excluido - página Notas e Documentação Odonto
    [Tags]    menus_ocultos
    Navegação e Validação Menu Excluido - página Notas e Documentação Odonto

