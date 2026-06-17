*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Configuração de empresa para Relatórios - Resumo de Indicadores - Empresa-8
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa    ${Empresa_8}
    Validar empresa configurada    ${Empresa_8} 

Validação da Navegação para Relatórios - Indicadores Gerais
    [Tags]    navegacao
    Navegação página Resumo Indicadores Gerais

Validação da Navegação para Relatórios - Indicadores Gerais por Mes
    [Tags]    navegacao
    Navegação página Resumo Indicadores Gerais por Mes
    
Validação da Navegação para Relatórios - Resumo de Indicadores - Evolução Sinistralidade
    [Tags]    navegacao
    Navegação página Evolução Sinistralidade

Validação da Navegação para Relatórios - Resumo de Indicadores - Evolução de Sinistralidade - Detalhado
    [Tags]    navegacao
    Navegação página Evolução Sinistralidade - Detalhado

Validação da Navegação para Relatórios - Resumo de Indicadores - Evolução do Sinistro
    [Tags]    navegacao
    Navegação página Evolução Sinistro

Validação da Navegação para Relatórios - Resumo de Indicadores - Financeiro por Subestipulante
    [Tags]    navegacao
    Navegação página Sinistro por Subestipulante

Configuração de empresa para Relatórios - Resumo de Indicadores - Empresa-7
    [Tags]    navegacao 
    Navegação página Configuração
    Configurar empresa    ${Empresa_7}
    Validar empresa configurada    ${Empresa_7}

Validação da Navegação para Relatórios - Resumo de Indicadores - Sinistralidade Período Reajuste
    [Tags]    navegacao
    Navegação página Sinistralidade Período Reajuste

# Tela Sinistralidade Periodo Reajuste com BUG verificar 
