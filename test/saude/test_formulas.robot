*** Settings ***
Resource    ../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão
Test Setup        Click    ${mnu_home_page} 

*** Test Cases ***
Configuração de Empresa
    [Tags]    formulas
    Navegação página Configuração
    Configurar empresa    ${Empresa_8}       
    Validar empresa configurada    ${Empresa_8} 

Teste validação de fórmula: (Porcentagem Sinistralidade) - Evolução Sinistralidade
    [Tags]    formulas     bug
    Navegação página Evolução Sinistralidade

    ${file}    Set Variable        ${EXECDIR}/resource/download/resumo_financeiro.csv   
    ${dir}     Set Variable        ${EXECDIR}/resource/download
    
    # # Captura de arquivos
    Fazer Download CSV    ${file}
        
    # Arquivo Leitura de arquivos
    ${lista_data}    ${lista_premio}    ${lista_sinistro}    ${lista_sinistralidade}    ${lista_copay}    Ler arquivo csv - Indicadores - Evolução Sinistralidade   arquivo=${file}

    # Excluir arquivos
    Remove Files    ${file}
    Remove Directory    ${dir}
    
    # Validação de fórmula
    Validação de fórmula Porcentagem Sinistralidade - Evolução Sinistralidade    ${lista_data}
    
Teste validação de fórmula: (Sinistro Per capita) - Evolução do sinistro
    [Tags]    formulas    bug

    Navegação página Evolução Sinistro
    
    ${file}    Set Variable        ${EXECDIR}/resource/download/financeiro_pos.csv   
    ${dir}     Set Variable        ${EXECDIR}/resource/download
    
    # # Captura de arquivos
    Fazer Download CSV    ${file}
        
     # # Arquivo Leitura de arquivos
    ${lista_data}       ${lista_vidas}    ${lista_sinistro}    ${lista_per_cap}    
    ...    Ler arquivo csv - Indicadores - Evolução Sinistro    arquivo=${file}
    
    # Excluir arquivos
    Remove Files    ${file}
    Remove Directory    ${dir}
    
    # Validação de fórmula
    Validação de fórmula Sinistro Per capita - Evolução do sinistro    ${lista_data}
