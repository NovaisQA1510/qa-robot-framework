*** Settings ***
Resource    ../../../resource/odonto/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Validação da Navegação para Configuração - Relatórios
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa    ${Empresa_1}
    Validar empresa configurada    ${Empresa_1} 

Validação da Navegação para Relatórios Indicadores Demográficos - Perfil Demográfico
    [Tags]    navegacao
    Navegação para Relatórios - Perfil Demográfico

Validação da Navegação para Relatórios Indicadores Demográficos - Evolução de Vidas
    [Tags]    navegacao
    Navegação para Relatórios - Evolução de Vidas



