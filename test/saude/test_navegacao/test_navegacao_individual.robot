*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Configuração de empresa para Individual
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa    ${Empresa_5}
    Validar empresa configurada    ${Empresa_5} 

Validação da Navegação para Individual Acompanhamento
    [Tags]    navegacao
    Navegação página Individual Acompanhamento    

Validação da Navegação para Individual Scripts de Navegação
    [Tags]    navegacao
    Navegação página Scripts de Navegação

Validação da Navegação para Individual Pessoa Todos
    [Tags]    navegacao
    Navegação página Pessoa Todos

Validação da Navegação para Individual Resumo
    [Tags]    navegacao
    Navegação página Individual Resumo

Validação da Navegação para Individual Elegiveis
    [Tags]    navegacao
    Navegação página Individual Elegiveis

Validação da Navegação para Individual Hiperconsultadores
    [Tags]    navegacao
    Navegação página Individual Hiperconsultadores

Validação da Navegação para Individual Hiperconsultadores Por Familia
    [Tags]    navegacao
    Navegação página Individual Hiperconsultadores Por Familia

Validação da Navegação para Individual Recem Internados
    [Tags]    navegacao
    Navegação página Individual Recem Internados

Validação da Navegação para Individual Crecente
    [Tags]    navegacao
    Navegação página Individual Crecente

Validação da Navegação página Individual High Users
    [Tags]    navegacao
    Navegação página Individual High Users

Validação da Navegação página Individual High Users do Mes
    [Tags]    navegacao
    Navegação página Individual High Users do Mes

Validação da Navegação página Individual Uso Constante
    [Tags]    navegacao
    Navegação página Individual Uso Constante

Validação da Navegação página Individual Sem Eventos
    [Tags]    navegacao
    Navegação página Individual Sem Eventos
