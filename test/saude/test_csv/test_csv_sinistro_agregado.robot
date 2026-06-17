*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown     Encerrar sessão

*** Test Cases ***

# Configuração
SETUP - Validação de CSV - Sinistro Agregado 
    [Tags]    csv    
    Navegação página Configuração
    Configurar empresa    ${Empresa_8}
    Validar empresa configurada    ${Empresa_8}

Validação da Navegação para Relatórios - Sinistro Agregado - Tipo Evento
    [Tags]    csv    
    Navegação página Tipo de Evento

    ${zip_file}    Set Variable            ${EXECDIR}/resource/download/tipo_evento.zip   
    ${dir}         Set Variable            ${EXECDIR}/resource/download/sinistro_cetipo_tabela
    ${raiz}        Set Variable            ${EXECDIR}/resource/download


    # # Captura de arquivos
    Fazer Download CSV    ${zip_file}
    Unzip arquivo   ${zip_file}     ${dir}

    # Listando Arquivos
    ${sinistro_cetipo_grafico}                           Listar arquivos csv    diretorio=${dir}    nome_arquivo=sinistro_cetipo_grafico
    ${sinistro_cetipo_tabela}                            Listar arquivos csv    diretorio=${dir}    nome_arquivo=sinistro_cetipo_tabela

     #Arquivo Leitura de arquivos
     ${lista_coluna_1}       ${lista_coluna_2}    ${lista_coluna_3}       ${lista_coluna_4}       
     ...    Ler arquivo csv - Sinistro - Analise - Tipo Evento   arquivo=${dir}/${sinistro_cetipo_tabela}    
    
    #Excluir arquivos
    Remove Files    ${dir}/${sinistro_cetipo_grafico}    
    ...             ${dir}/${sinistro_cetipo_tabela}    
    ...             ${zip_file}
    Remove Directory    ${dir}
    Remove Directory    ${raiz}   

    Capturar e Validar tabela Sinistro Analise - Tipo Evento    ${lista_coluna_1}    ${lista_coluna_2}    ${lista_coluna_3}   ${lista_coluna_4}     
    

Validação da Navegação para Relatórios - Sinistro Agregado - Faixa Etaria
    [Tags]    csv    
    Navegação página Faixa Etaria

    ${zip_file}    Set Variable            ${EXECDIR}/resource/download/faixa_etaria.zip   
    ${dir}         Set Variable            ${EXECDIR}/resource/download/sinistro_idade_tabela
    ${raiz}        Set Variable            ${EXECDIR}/resource/download


    # # Captura de arquivos
    Fazer Download CSV    ${zip_file}
    Unzip arquivo   ${zip_file}     ${dir}

    # # Listando Arquivos
    ${sinistro_idade_grafico}                           Listar arquivos csv    diretorio=${dir}    nome_arquivo=sinistro_idade_grafico
    ${sinistro_idade_tabela}                            Listar arquivos csv    diretorio=${dir}    nome_arquivo=sinistro_idade_tabela

     # Arquivo Leitura de arquivos
     ${lista_coluna_1}       ${lista_coluna_2}    ${lista_coluna_3}       ${lista_coluna_4}    ${lista_coluna_5}    
     ...    Ler arquivo csv - Sinistro - Analise - Faixa Etaria   arquivo=${dir}/${sinistro_idade_tabela}    

    # Excluir arquivos
    Remove Files    ${dir}/${sinistro_idade_grafico}    
    ...             ${dir}/${sinistro_idade_tabela}    
    ...             ${zip_file}
    Remove Directory    ${dir}
    Remove Directory    ${raiz}   

    Capturar e Validar tabela Sinistro Analise - Faixa Etaria    ${lista_coluna_1}    ${lista_coluna_2}    ${lista_coluna_3}   ${lista_coluna_4}    ${lista_coluna_5}    
    
*** Comments ***
Faltando:

