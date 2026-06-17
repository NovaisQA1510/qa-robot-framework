*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Configuração de empresa para Relatórios - Evoluções de Sinistro 
    [Tags]    navegacao    
    Navegação página Configuração
    Configurar empresa    ${Empresa_8}
    Validar empresa configurada    ${Empresa_8} 

Validação da Navegação para Relatórios - Evoluções de Sinistro - Per Capita 
    [Tags]    navegacao    
    Navegação página Per Capita

Validação da Navegação para Relatórios - Evoluções de Sinistro - Evo. Tipo De Evento
    [Tags]    navegacao    
    Navegação página Evo. Tipo de Evento
 
Validação da Navegação para Relatórios - Evoluções de Sinistro - Consultas
    [Tags]    navegacao    
    Navegação página Consultas

Validação da Navegação para Relatórios - Evoluções de Sinistro - Consultas - Qtd
    [Tags]    navegacao    
    Navegação página Consultas - Qtd

Validação da Navegação para Relatórios - Evoluções de Sinistro - Consultas - Valor Medio 
    [Tags]    navegacao    
    Navegação página Consultas - Valor Medio 

Validação da Navegação para Relatórios - Evoluções de Sinistro - Consultas - Valor Total
    [Tags]    navegacao    
    Navegação página Consultas - Valor Total 

Validação da Navegação para Relatórios - Evoluções de Sinistro - Exames
    [Tags]    navegacao    
    Navegação página Exames

Validação da Navegação para Relatórios - Evoluções de Sinistro - Internações
    [Tags]    navegacao    
    Navegação página Internações

Validação da Navegação para Relatórios - Evoluções de Sinistro - Tratamento
    [Tags]    navegacao    
    Navegação página Tratamento

Validação da Navegação para Relatórios - Evoluções de Sinistro - Outros
    [Tags]    navegacao    
    Navegação página Outros

Validação da Navegação para Relatórios - Evoluções de Sinistro - Ambulatorial x Internação
    [Tags]    navegacao    
      Navegação página Ambulatorio X Internação 

Validação da Navegação para Relatórios - Evoluções de Sinistro - Frequências Ambulatoriais
    [Tags]    navegacao    
    Navegação página Frequencias Ambulatoriais

Validação da Navegação para Relatórios - Evoluções de Sinistro - Titularidade
    [Tags]    navegacao    
    Navegação página Titularidade

Validação da Navegação para Relatórios - Evoluções de Sinistro - Evolução por Titularidade e Sexo
    [Tags]    navegacao    
    Navegação página Evolução por Titularidade e Sexo

Validação da Navegação para Relatórios - Evoluções de Sinistro - Evolução por Plano
    [Tags]    navegacao    
    Navegação página Evolução por Plano

Validação da Navegação para Relatórios - Evoluções de Sinistro - Evolução por Subestipulante
    [Tags]    navegacao    
    Navegação página Evolução por Subestipulante

Validação da Navegação para Relatórios - Evoluções de Sinistro - Evolução por Descritores
    [Tags]    navegacao    
    Navegação página Evolução por Descritores 