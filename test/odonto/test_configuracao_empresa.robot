*** Settings ***
Resource    ../../resource/odonto/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão
Test Setup        Click    ${mnu_home_page} 

*** Test Cases ***
Configuração de Empresa - Cenário 1
    [Tags]    config-empresa
    Navegação página Configuração
    Configurar empresa    ${Empresa_1}       
    Validar empresa configurada    ${Empresa_1} 

