*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown     Encerrar sessão


*** Test Cases ***
Configuração de empresa para Relatórios - Comparativos 
    [Tags]    navegacao
    Navegação página Configuração
    Configurar empresa             ${Empresa_8}
    Validar empresa configurada    ${Empresa_8}

Validação da Navegação para Relatórios - Comparativos - Sinistro Total
    [Tags]    navegacao
    Navegação página Sinistro Total

Validação da Navegação para Relatórios - Comparativos - Run Off
    [Tags]    navegacao
    Navegação página Run Off

Validação da Navegação para Relatórios - Comparativos - Periodo x Periodo
    [Tags]    navegacao
    Navegação página Periodo x Periodo

Validação da Navegação para Relatórios - Comparativos - Concentração de Custos
    [Tags]    navegacao
    Navegação página Concentração de Custos
    
Validação da Navegação para Relatórios - Comparativos - Comparativo Anual
    [Tags]    navegacao
    Navegação página Comparativo Anual

 Validação da Navegação para Relatórios - Comparativos - Sinistro X Vidas
    [Tags]    navegacao
    Navegação página Sinistro X Vidas   

Validação da Navegação para Relatórios - Comparativos - Ativos X Desligados
    [Tags]    navegacao
    Navegação página Ativos X Desligados  

Validação da Navegação para Relatórios - Comparativos - Navegação página Quantidade Pessoas por Procedimentos
    [Tags]    navegacao
    Navegação página Quantidade Pessoas por Procedimentos