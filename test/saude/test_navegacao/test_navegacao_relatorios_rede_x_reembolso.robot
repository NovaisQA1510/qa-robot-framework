*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Configuração de empresa para Relatórios - Rede X Reembolso 
    [Tags]    navegacao    
    Navegação página Configuração
    Configurar empresa    ${Empresa_8}
    Validar empresa configurada    ${Empresa_8} 

Validação da Navegação para Relatórios - Rede x Reembolso - Valores Agregados 
    [Tags]    navegacao    
    Navegação página Valores Agregados 

Validação da Navegação para Relatórios - Rede x Reembolso - Por Plano
    [Tags]    navegacao    
    Navegação página Pos Plano
 
Validação da Navegação para Relatórios - Rede x Reembolso - Evolução Por Metricas
    [Tags]    navegacao    
    Navegação página Evolução Por Metricas

# Validação da Navegação para Relatórios - Rede x Reembolso - Evolução Por Tipo
#     [Tags]    navegacao    
#     Navegação página Evolução Por Tipo

# Validação da Navegação para Relatórios - Rede x Reembolso - Distribuição 
#     [Tags]    navegacao    
#     Navegação página Distribuição 

# Validação da Navegação para Relatórios - Rede x Reembolso - Evolução Reembolso por Plano
#     [Tags]    navegacao    
#     Navegação página Evolução Reembolso por Plano


*** Comments ***
Falta elaborar essas 3 telas Evolução Por Tipo; Distribuição; Evolução Reembolso por Plano