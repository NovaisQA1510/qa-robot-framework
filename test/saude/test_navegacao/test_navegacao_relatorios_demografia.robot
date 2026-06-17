*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Configuração de empresa para Relatórios - Demografia
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa    ${Empresa_8}
    Validar empresa configurada    ${Empresa_8} 

Validação da Navegação para Relatórios - Demografia - Perfil Demografico
    [Tags]    navegacao
    Navegação página Perfil Demografico

Validação da Navegação para Relatórios - Demografia - Evolução de Vidas
    [Tags]    navegacao
    Navegação página Evolução de Vidas

Validação da Navegação para Relatórios - Demografia - Evolução por Titularidade/Sexo
    [Tags]    navegacao
    Navegação página Evolução por Titularidade/Sexo

Validação da Navegação para Relatórios - Demografia - Evolução de Vidas por Plano
    [Tags]    navegacao
    Navegação página Evolução de Vidas por Plano

Validação da Navegação para Relatórios - Demografia - Vidas por Titularidade/Sexo
    [Tags]    navegacao
    Navegação página Vidas por Titularidade e Sexo

Validação da Navegação para Relatórios - Demografia - Perfil Sem Uso no Plano
    [Tags]    navegacao    bug
    Navegação página Perfil Sem Uso no Plano

*** Comments ***
BUG: Teste Navegação para Relatórios - Demografia - Perfil Sem Uso no Plano
    *Obs: A tela estar oculta por solicitação do P.O para correção dos dados Validar tbm quando estiver UP teste de CSV, tela a tela, reprocessamento  

