*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Configuração de empresa para Labs
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa    ${Empresa_5}
    Validar empresa configurada    ${Empresa_5} 

Validação da Navegação página Labs 
    [Tags]    navegacao
    Navegação página Labs

Validação da Navegação página Labs Hiperconsultores
    [Tags]    navegacao
    Navegação página Labs Hipercosultores

Validação da Navegação página Labs Guias de Procedimentos
    [Tags]    navegacao
    Navegação página Labs Guias de Procedimentos

Validação da Navegação página Labs Sinistro de Procedimentos
    [Tags]    navegacao
   Navegação página Labs Sinistro de Procedimentos

Validação da Navegação página Labs Tentáculos
    [Tags]    navegacao
   Navegação página Labs Tentáculos

Validação da Navegação página Labs Benchmark Geral
    [Tags]    navegacao
   Navegação página Labs Benchmark Geral

Validação da Navegação página Labs Benchmark Por Prestador
    [Tags]    navegacao
    Navegação página Labs Benchmark Por Prestador

Validação da Navegação página Labs Benchmark Por Procedimento
    [Tags]    navegacao
    Navegação página Labs Benchmark Por Procedimento

Validação da Navegação página Labs Benchmark Cruzados
    [Tags]    navegacao
    Navegação página Labs Benchmark Cruzados

Validação da Navegação página Benchmark Procedimentos Unicos
    [Tags]    navegacao
    Navegação página Labs Benchmark Procedimentos Unicos
    