*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Configuração de empresa para Relatórios - Sinistro Agregados 
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa    ${Empresa_8}
    Validar empresa configurada    ${Empresa_8} 

Validação da Navegação para Relatórios - Sinistro Agregados - Tipo de Evento
    [Tags]    navegacao
    Navegação página Tipo de Evento

Validação da Navegação para Relatórios - Sinistro Agregados - Faixa Etária
    [Tags]    navegacao
    Navegação página Faixa Etaria

Validação da Navegação para Relatórios - Sinistro Agregados - Faixa Etária per Capita
    [Tags]    navegacao
    Navegação página Sinistro Faixa Etaria Per Capita

Validação da Navegação para Relatórios - Sinistro Agregados - Titularidade e Sexo
    [Tags]    navegacao
    Navegação página Sinistro Titularidade e Sexo

Validação da Navegação para Relatórios - Sinistro Agregados - Planos
    [Tags]    navegacao
    Navegação página Sinistro Planos

Validação da Navegação para Relatórios - Sinistro Agregados - Plano Per Capita 
    [Tags]    navegacao
    Navegação página Sinistro Plano Per Capita 

Validação da Navegação para Relatórios - Sinistro Agregados - Subestipulante 
    [Tags]    navegacao
    Navegação página Sinistro Subestipulante 

Validação da Navegação para Relatórios - Sinistro Agregados - Descritores de evento 
    [Tags]    navegacao
    Navegação página Sinistro Descritores de Evento 

*** Comments ***
