*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

*** Test Cases ***
Teste de Reprocessamento - Demografia - Perfil Demografico
    [Tags]    reprocessamento    local_test
    
    ${lista_valores_ambiente_1}    Reprocessamento - Demografia - Perfil Demografico    ${USERNAME}    ${PASSWORD}    ${BASE_URL}    ${Empresa_rep_azul_2023}
    ${lista_valores_ambiente_2}    Reprocessamento - Demografia - Perfil Demografico    ${USERNAME_2}    ${PASSWORD_2}    ${BASE_URL_2}    ${Empresa_rep_azul_2023}

    Lists Should Be Equal    ${lista_valores_ambiente_1}    ${lista_valores_ambiente_2}

Teste de Reprocessamento - Demografia - Evolução de Vidas
    [Tags]    reprocessamento    local_test 
    
    ${lista_valores_ambiente_1_coluna_2}    ${lista_valores_ambiente_1_coluna_3}    Reprocessamento - Demografia - Evolução de Vidas    ${USERNAME}    ${PASSWORD}    ${BASE_URL}    ${Empresa_rep_azul_2023}
    ${lista_valores_ambiente_2_coluna_2}    ${lista_valores_ambiente_2_coluna_3}    Reprocessamento - Demografia - Evolução de Vidas    ${USERNAME_2}    ${PASSWORD_2}    ${BASE_URL_2}    ${Empresa_rep_azul_2023}

    Lists Should Be Equal    ${lista_valores_ambiente_1_coluna_2}    ${lista_valores_ambiente_2_coluna_2}
    Lists Should Be Equal    ${lista_valores_ambiente_1_coluna_3}    ${lista_valores_ambiente_2_coluna_3}

Teste de Reprocessamento - Demografia - Evolução de Vidas por Plano
    [Tags]    reprocessamento    local_test 

    ${lista_ambiente_1_coluna_2}       ${lista_ambiente_1_coluna_3}       ${lista_ambiente_1_coluna_4}       
    ...    ${lista_ambiente_1_coluna_5}    ${lista_ambiente_1_coluna_6}       ${lista_ambiente_1_coluna_7}    ${lista_ambiente_1_coluna_8}
    ...    ${lista_ambiente_1_coluna_9}     ${lista_ambiente_1_coluna_10}     ${lista_ambiente_1_coluna_11}     ${lista_ambiente_1_coluna_12}
    ...    ${lista_ambiente_1_coluna_13}     Reprocessamento - Demografia - Evolução de Vidas por Plano    ${USERNAME}    ${PASSWORD}    ${BASE_URL}    ${Empresa_rep_azul_2023}
    
    ${lista_ambiente_2_coluna_2}       ${lista_ambiente_2_coluna_3}       ${lista_ambiente_2_coluna_4}       
    ...    ${lista_ambiente_2_coluna_5}    ${lista_ambiente_2_coluna_6}       ${lista_ambiente_2_coluna_7}    ${lista_ambiente_2_coluna_8}
    ...    ${lista_ambiente_2_coluna_9}     ${lista_ambiente_2_coluna_10}     ${lista_ambiente_2_coluna_11}     ${lista_ambiente_2_coluna_12}
    ...    ${lista_ambiente_2_coluna_13}     Reprocessamento - Demografia - Evolução de Vidas por Plano    ${USERNAME}    ${PASSWORD}    ${BASE_URL}    ${Empresa_rep_azul_2023}
   
    Should Be Equal    ${lista_ambiente_1_coluna_2}     ${lista_ambiente_2_coluna_2}
    Should Be Equal    ${lista_ambiente_1_coluna_3}     ${lista_ambiente_2_coluna_3}
    Should Be Equal    ${lista_ambiente_1_coluna_4}     ${lista_ambiente_2_coluna_4}
    Should Be Equal    ${lista_ambiente_1_coluna_5}     ${lista_ambiente_2_coluna_5}
    Should Be Equal    ${lista_ambiente_1_coluna_6}     ${lista_ambiente_2_coluna_6}
    Should Be Equal    ${lista_ambiente_1_coluna_7}     ${lista_ambiente_2_coluna_7}
    Should Be Equal    ${lista_ambiente_1_coluna_8}     ${lista_ambiente_2_coluna_8}
    Should Be Equal    ${lista_ambiente_1_coluna_9}     ${lista_ambiente_2_coluna_9}
    Should Be Equal    ${lista_ambiente_1_coluna_10}     ${lista_ambiente_2_coluna_10}
    Should Be Equal    ${lista_ambiente_1_coluna_11}     ${lista_ambiente_2_coluna_11}
    Should Be Equal    ${lista_ambiente_1_coluna_12}     ${lista_ambiente_2_coluna_12}
    Should Be Equal    ${lista_ambiente_1_coluna_13}     ${lista_ambiente_2_coluna_13}

# Reprocessamento - Demografia - Perfil Sem uso no Plano
#     [Tags]    csv    bug
#     Navegação página Perfil Sem Uso no Plano

#     ${zip_file}    Set Variable     ${EXECDIR}/resource/download/demografia_perfil_sem_evento.zip    
#     ${dir}         Set Variable     ${EXECDIR}/resource/download/demografia
#     ${raiz}        Set Variable     ${EXECDIR}/resource/download
    
#     # Captura de arquivos
#     Fazer Download CSV    ${zip_file}
#     Unzip arquivo   ${zip_file}     ${dir}
    
#     # # Listando Arquivos
#     ${sem_eventos_faixaetaria_TODOS}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=sem_eventos_faixaetaria_TODOS
#     ${sem_eventos_genero_TODOS}         Listar arquivos csv    diretorio=${dir}    nome_arquivo=sem_eventos_genero_TODOS
#     ${sem_eventos_indicadores_TODOS}    Listar arquivos csv    diretorio=${dir}    nome_arquivo=sem_eventos_indicadores_TODOS
#     ${sem_eventos_titularidade}         Listar arquivos csv    diretorio=${dir}    nome_arquivo=sem_eventos_titularidade
    
#     # Arquivo Leitura de arquivos
#     ${coluna_1_faixaetaria}        ${coluna_2_faixaetaria}    ${coluna_3_faixaetaria}       Ler arquivo csv - Indicadores Demográficos - Perfil Sem Uso no Plano - 3 colunas   arquivo=${dir}/${sem_eventos_faixaetaria_TODOS}      
#     ${coluna_1_genero}             ${coluna_2_genero}                                       Ler arquivo csv - Indicadores Demográficos - Perfil Sem Uso no Plano - 2 colunas   arquivo=${dir}/${sem_eventos_genero_TODOS}           
#     ${coluna_1_indicadores}        ${coluna_2_indicadores}                                  Ler arquivo csv - Indicadores Demográficos - Perfil Sem Uso no Plano - 2 colunas   arquivo=${dir}/${sem_eventos_indicadores_TODOS}      
#     ${coluna_1_titularidade}       ${coluna_2_titularidade}                                 Ler arquivo csv - Indicadores Demográficos - Perfil Sem Uso no Plano - 2 colunas   arquivo=${dir}/${sem_eventos_titularidade}           

#     # Excluir arquivos
#     Remove Files    ${dir}/${sem_eventos_faixaetaria_TODOS}    
#     ...             ${dir}/${sem_eventos_genero_TODOS}    
#     ...             ${dir}/${sem_eventos_indicadores_TODOS}    
#     ...             ${dir}/${sem_eventos_titularidade}
#     ...             ${zip_file}
#     Remove Directory    ${dir}
#     Remove Directory    ${raiz}

#     Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Sem Uso no Plano - Faixa etárias    ${coluna_1_faixaetaria}
#     Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Sem Uso no Plano - Genero    ${coluna_1_genero}             ${coluna_2_genero}
#     Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Sem Uso no Plano - Indicadores      ${coluna_1_indicadores}    ${coluna_2_indicadores}     # BUG
#     Capturar e Validar tabela Relatório Indicadores Demográficos - Perfil Sem Uso no Plano - Titularidade    ${coluna_1_titularidade}             ${coluna_2_titularidade}

*** Comments ***
Com BUG
- Vidas por Titularidade e Sexo -> COM BUG NEM FOI POSSÍVEL COMEÇAR, são baixados 3 csv de maneira separada e devem ser num arquivo .zip
- Perfil Sem uso no plano -> bugado essa validação 29,2 != 29.2

Cenários não automatizáveis:
- Evolução por Titularidade e Sexo -> Não é possível automatizar esses cenários.