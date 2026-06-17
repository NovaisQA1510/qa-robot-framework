*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Configuração de empresa para Individual - Todos
    [Tags]    navegacao    
    Navegação página Configuração
    Configurar empresa    ${Empresa_11}
    Validar empresa configurada    ${Empresa_11} 

Validação da Funcionalidade Pre-preenchimento - True 
    [Tags]    navegacao    
    Navegação página Pessoa Todos
    Buscando pelo Nome Pessoa
    Abrir Modal de Evolução 
    ${valor_txa_preenchido}    Validação de Pre-preenchimento
    Abrir Modal de Evolução     
    Validar Dados Salvos     ${valor_txa_preenchido}
    Exclusão de Dados




