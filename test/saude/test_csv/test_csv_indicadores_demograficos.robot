*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
SETUP - Validação de CSV - Demografia
    [Tags]    csv
    Navegação página Configuração
    Configurar empresa    ${Empresa_8}
    Validar empresa configurada    ${Empresa_8}

Validação de CSV - Demografia - Perfil Demografico
    [Tags]    csv
    Navegação página Perfil Demografico

    ${zip_file}    Set Variable     ${EXECDIR}/resource/download/demografia_perfil_populacional.zip    
    ${dir}         Set Variable     ${EXECDIR}/resource/download/demografia
    ${raiz}        Set Variable     ${EXECDIR}/resource/download
    
    # Captura de arquivos
    Fazer Download CSV    ${zip_file}
    Unzip arquivo   ${zip_file}     ${dir}
    
    # # Listando Arquivos
    ${demografico_faixaetaria_TODOS}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=demografico_faixaetaria_TODOS
    ${demografico_genero_TODOS}         Listar arquivos csv    diretorio=${dir}    nome_arquivo=demografico_genero_TODOS
    ${demografico_indicadores_TODOS}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=demografico_indicadores_TODOS
    ${demografico_titularidade}         Listar arquivos csv    diretorio=${dir}    nome_arquivo=demografico_titularidade
    
    # Arquivo Leitura de arquivos
    ${coluna_1_faixaetaria}        ${coluna_2_faixaetaria}    ${coluna_3_faixaetaria}       Ler arquivo csv - Indicadores Demográficos - Perfil Demografico   arquivo=${dir}/${demografico_faixaetaria_TODOS}      modelo=3
    ${coluna_1_genero}             ${coluna_2_genero}                                       Ler arquivo csv - Indicadores Demográficos - Perfil Demografico   arquivo=${dir}/${demografico_genero_TODOS}           modelo=2
    ${coluna_1_indicadores}        ${coluna_2_indicadores}                                  Ler arquivo csv - Indicadores Demográficos - Perfil Demografico   arquivo=${dir}/${demografico_indicadores_TODOS}      modelo=2
    ${coluna_1_titularidade}       ${coluna_2_titularidade}                                 Ler arquivo csv - Indicadores Demográficos - Perfil Demografico   arquivo=${dir}/${demografico_titularidade}           modelo=2

    # Excluir arquivos
    Remove Files    ${dir}/${demografico_faixaetaria_TODOS}    
    ...             ${dir}/${demografico_genero_TODOS}    
    ...             ${dir}/${demografico_indicadores_TODOS}    
    ...             ${dir}/${demografico_titularidade}
    ...             ${zip_file}
    Remove Directory    ${dir}
    Remove Directory    ${raiz}
    
    # Caputa de Tela e validação
    Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Demografico - Faixa etárias    ${coluna_1_faixaetaria}
    Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Demografico - Genero    ${coluna_1_genero}             ${coluna_2_genero}
    Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Demografico - Indicadores      ${coluna_1_indicadores}    ${coluna_2_indicadores}
    Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Demografico - Titularidade    ${coluna_1_titularidade}             ${coluna_2_titularidade}

Validação de CSV - Demografia - Evolução de Vidas
    [Tags]    csv 
    Navegação página Evolução de Vidas
    
    ${zip_file}    Set Variable     ${EXECDIR}/resource/download/demografia_evolucao_populacional.zip    
    ${dir}         Set Variable     ${EXECDIR}/resource/download/demografia
    ${raiz}        Set Variable     ${EXECDIR}/resource/download
    
    # Captura de arquivos
    Fazer Download CSV    ${zip_file}
    Unzip arquivo   ${zip_file}     ${dir}
    
    # # Listando Arquivos
    ${evolucao_populacional_tabela}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=evolucao_populacional_tabela_
    ${evolucao_populacional_grafico}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=evolucao_populacional_grafico_

    # Arquivo Leitura de arquivos
    ${lista_coluna_1}        ${lista_coluna_2}    ${lista_coluna_3}       Ler arquivo csv - Indicadores Demográficos - Evolução de Vidas   arquivo=${dir}/${evolucao_populacional_tabela}

    # Excluir arquivos
    Remove Files    ${dir}/${evolucao_populacional_tabela}
    ...             ${dir}/${evolucao_populacional_grafico}    
    ...             ${zip_file}
    Remove Directory    ${dir}
    Remove Directory    ${raiz}
    
    # Caputa de Tela e validação
    Capturar e Validar tabela Relatório Indicadores Demográficos - Evolução de Vidas    ${lista_coluna_1}        ${lista_coluna_2}    ${lista_coluna_3} 

Validação de CSV - Demografia - Evolução de Vidas por Plano
    [Tags]    csv
    Navegação página Evolução de Vidas por Plano

    ${file}    Set Variable        ${EXECDIR}/resource/download/evolucao_vidas_plano.csv   
    ${dir}     Set Variable        ${EXECDIR}/resource/download
    
    # Captura de arquivos
    Fazer Download CSV    ${file}    
        
    # Arquivo Leitura de arquivos
    ${lista_coluna_1}        ${lista_coluna_2}       ${lista_coluna_3}       ${lista_coluna_4}       
    ...    ${lista_coluna_5}    ${lista_coluna_6}       ${lista_coluna_7}    ${lista_coluna_8}
    ...    ${lista_coluna_9}     ${lista_coluna_10}     ${lista_coluna_11}     ${lista_coluna_12}
    ...    ${lista_coluna_13}        Ler arquivo csv - Indicadores Demográficos - Evolução Vidas por Plano   arquivo=${file}

    # Excluir arquivos
    Remove Files    ${file}
    Remove Directory    ${dir}
    
    # Caputa de Tela e validação
    Capturar e Validar tabela Resumo Financeiro - Indicadores Demográficos - Evolução Vidas por Plano    ${lista_coluna_1}        ${lista_coluna_2}       ${lista_coluna_3}       ${lista_coluna_4}       
    ...    ${lista_coluna_5}    ${lista_coluna_6}       ${lista_coluna_7}    ${lista_coluna_8}
    ...    ${lista_coluna_9}     ${lista_coluna_10}     ${lista_coluna_11}     ${lista_coluna_12}
    ...    ${lista_coluna_13}

Validação de CSV - Demografia - Perfil Sem uso no Plano
    [Tags]    csv    bug
    Navegação página Perfil Sem Uso no Plano

    ${zip_file}    Set Variable     ${EXECDIR}/resource/download/demografia_perfil_sem_evento.zip    
    ${dir}         Set Variable     ${EXECDIR}/resource/download/demografia
    ${raiz}        Set Variable     ${EXECDIR}/resource/download
    
    # Captura de arquivos
    Fazer Download CSV    ${zip_file}
    Unzip arquivo   ${zip_file}     ${dir}
    
    # # Listando Arquivos
    ${sem_eventos_faixaetaria_TODOS}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=sem_eventos_faixaetaria_TODOS
    ${sem_eventos_genero_TODOS}         Listar arquivos csv    diretorio=${dir}    nome_arquivo=sem_eventos_genero_TODOS
    ${sem_eventos_indicadores_TODOS}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=sem_eventos_indicadores_TODOS
    ${sem_eventos_titularidade}         Listar arquivos csv    diretorio=${dir}    nome_arquivo=sem_eventos_titularidade
    
    # Arquivo Leitura de arquivos
    ${coluna_1_faixaetaria}        ${coluna_2_faixaetaria}    ${coluna_3_faixaetaria}       Ler arquivo csv - Indicadores Demográficos - Perfil Sem Uso no Plano - 3 colunas   arquivo=${dir}/${sem_eventos_faixaetaria_TODOS}      
    ${coluna_1_genero}             ${coluna_2_genero}                                       Ler arquivo csv - Indicadores Demográficos - Perfil Sem Uso no Plano - 2 colunas   arquivo=${dir}/${sem_eventos_genero_TODOS}           
    ${coluna_1_indicadores}        ${coluna_2_indicadores}                                  Ler arquivo csv - Indicadores Demográficos - Perfil Sem Uso no Plano - 2 colunas   arquivo=${dir}/${sem_eventos_indicadores_TODOS}      
    ${coluna_1_titularidade}       ${coluna_2_titularidade}                                 Ler arquivo csv - Indicadores Demográficos - Perfil Sem Uso no Plano - 2 colunas   arquivo=${dir}/${sem_eventos_titularidade}           

    # Excluir arquivos
    Remove Files    ${dir}/${sem_eventos_faixaetaria_TODOS}    
    ...             ${dir}/${sem_eventos_genero_TODOS}    
    ...             ${dir}/${sem_eventos_indicadores_TODOS}    
    ...             ${dir}/${sem_eventos_titularidade}
    ...             ${zip_file}
    Remove Directory    ${dir}
    Remove Directory    ${raiz}

    Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Sem Uso no Plano - Faixa etárias    ${coluna_1_faixaetaria}
    Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Sem Uso no Plano - Genero    ${coluna_1_genero}             ${coluna_2_genero}
    Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Sem Uso no Plano - Indicadores      ${coluna_1_indicadores}    ${coluna_2_indicadores}     # BUG
    Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Sem Uso no Plano - Titularidade    ${coluna_1_titularidade}             ${coluna_2_titularidade}

*** Comments ***
Com BUG
- Vidas por Titularidade e Sexo -> COM BUG NEM FOI POSSÍVEL COMEÇAR, são baixados 3 csv de maneira separada e devem ser num arquivo .zip
- Perfil Sem uso no plano -> bugado essa validação 29,2 != 29.2

Cenários não automatizáveis:
- Evolução por Titularidade e Sexo -> Não é possível automatizar esses cenários.