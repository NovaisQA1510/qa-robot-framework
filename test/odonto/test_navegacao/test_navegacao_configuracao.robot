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

Validação da Navegação para Configuração - Gerenciar Agrupamentos
    [Tags]    navegacao
    Navegação página Gerenciar Agrupamentos

Validação da Navegação para Configuração - Empresas
    [Tags]    navegacao
    Navegação página Empresas

Validação da Navegação para Configuração - Acompanhamento
    [Tags]    navegacao
    Navegação página Acompanhamento

Validação da Navegação para Configuração - Copay
    [Tags]    navegacao
    Navegação página Copay

Validação da Navegação para Configuração - Importação de Dados
    [Tags]    navegacao
    Navegação página Importação de Dados

Validação da Navegação para Configuração - Modelos Genéricos
    [Tags]    navegacao
    Navegação página Modelos Genéricos

Validação da Navegação para Configuração - Vidas por Grupos de Faturamentos
    [Tags]    navegacao
    Navegação página Vidas

Validação da Navegação para Configuração - Anotações
    [Tags]    navegacao
    Navegação página Anotações

Validação da Navegação para Configuração - Power BI
    [Tags]    navegacao
    Navegação página Power BI