*** Settings ***
Resource    ../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão
Test Setup        Click    ${mnu_home_page} 

*** Test Cases ***
Configuração de Empresa - Cenário 1
    [Tags]    config-empresa
    Navegação página Configuração
    Configurar empresa    ${Empresa_1}       
    Validar empresa configurada    ${Empresa_1} 

Configuração de Empresa - Cenário 2
    [Tags]    config-empresa
    Navegação página Configuração
    Configurar empresa    ${Empresa_2}
    Validar empresa configurada    ${Empresa_2} 

Configuração de Empresa - Cenário 3
    [Tags]    config-empresa
    Navegação página Configuração
    Configurar empresa    ${Empresa_3}
    Validar empresa configurada    ${Empresa_3} 

Configuração de Empresa - Cenário 4
    [Tags]    config-empresa
    Navegação página Configuração
    Configurar empresa    ${Empresa_4}
    Validar empresa configurada    ${Empresa_4} 

Configuração de Empresa - Cenário 5
    [Tags]    config-empresa
    Navegação página Configuração
    Configurar empresa    ${Empresa_5}
    Validar empresa configurada    ${Empresa_5} 
