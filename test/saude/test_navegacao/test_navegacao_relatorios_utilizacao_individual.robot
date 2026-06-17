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

Validação da Navegação para Relatórios - Utilizacao Individual - Hiperconsultores
    [Tags]    navegacao
    Navegação página Hiperconsultadores

Validação da Navegação para Relatórios - Utilizacao Individual - Hiperconsultores Por Fonte
    [Tags]    navegacao
    Navegação página Hiperconsultadores Por Fonte

Validação da Navegação para Relatórios - Utilizacao Individual - Hiperconsultores Eletiva PS
    [Tags]    navegacao
    Navegação página Hiperconsultores Eletiva PS 
    
Validação da Navegação para Relatórios - Utilizacao Individual - Hiperconsultores Por Família
    [Tags]    navegacao
    Navegação página Hiperconsultores Por Família 
    
Validação da Navegação para Relatórios - Utilizacao Individual - Hiperexaminadores
    [Tags]    navegacao
    Navegação página Hiperexaminadores    


Validação da Navegação para Relatórios - Utilizacao Individual - Maiores Utilizadores
    [Tags]    navegacao
    Navegação página Maiores Utilizadores    

Validação da Navegação para Relatórios - Utilizacao Individual - Maiores Utilizadores Do Mês
    [Tags]    navegacao
    Navegação página Maiores Utilizadores Do Mês  

Validação da Navegação para Relatórios - Utilizacao Individual - Maiores Internações
    [Tags]    navegacao
    Navegação página Maiores Internações

Validação da Navegação para Relatórios - Utilizacao Individual - Uso Constante
    [Tags]    navegacao
   Navegação página Uso Constante

Validação da Navegação para Relatórios - Utilizacao Individual - Uso Crescente
    [Tags]    navegacao
    Navegação página Uso Crescente










