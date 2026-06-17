*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Validação da Navegação para Configuração - Configuração
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa    ${Empresa_5}
    Validar empresa configurada    ${Empresa_5} 

Navegação e Validação Menu Excluido - página Resumo Indicadores Executivo
    [Tags]    menus_ocultos
    Navegação e Validação Menu Excluido - página Resumo Indicadores Executivo

Navegação e Validação Menu Excluido - página Utilização por Faixa Etaria
    [Tags]    menus_ocultos
    Navegação e Validação Menu Excluido - página Utilização por Faixa Etaria

Navegação e Validação Menu Excluido - página Sinistro Faixa Etaria
    [Tags]    menus_ocultos
    Navegação e Validação Menu Excluido - página Sinistro Faixa Etaria

Navegação e Validação Menu Excluido - página Tipo de Evento (C)
    [Tags]    menus_ocultos
    Navegação e Validação Menu Excluido - página Tipo de Evento (C)

Navegação e Validação Menu Excluido - página Procedimentos
    [Tags]    menus_ocultos
    Navegação e Validação Menu Excluido - página Procedimentos

Navegação e Validação Menu Excluido - página Comparativos Sinistralidade
    [Tags]    menus_ocultos
    Navegação e Validação Menu Excluido - página Comparativos Sinistralidade

Navegação e Validação Menu Excluido - página Comparativos Quantidade de Eventos
    [Tags]    menus_ocultos
    Navegação e Validação Menu Excluido - página Comparativos Quantidade de Eventos
