# *** Settings ***
# Resource    ../../../resource/saude/utils/base.resource

# Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
# Suite Teardown     Encerrar sessão

# *** Test Cases ***
# SETUP - Validação de CSV - Resumo de Indicadores
#     [Tags]    csv
#     Navegação página Configuração
#     Configurar empresa    ${Empresa_8}
#     Validar empresa configurada    ${Empresa_8}

# Validação de CSV - Resumo de Indicadores - Indicadores Gerais
#     [Tags]    csv
#     Navegação página Resumo Indicadores Gerais

#     ${zip_file}    Set Variable     ${EXECDIR}/resource/download/indicadores_gerais.zip    
#     ${dir}         Set Variable     ${EXECDIR}/resource/download/indicadores_resumo
#     ${raiz}        Set Variable     ${EXECDIR}/resource/download
    
#     # Captura de arquivos
#     Fazer Download CSV    ${zip_file}
#     Unzip arquivo   ${zip_file}     ${dir}
    
#     # # Listando Arquivos
#     ${resgeral_perfilpopulacional}         Listar arquivos csv    diretorio=${dir}    nome_arquivo=resgeral_perfilpopulacional
#     ${resgeral_representatividade}         Listar arquivos csv    diretorio=${dir}    nome_arquivo=resgeral_representatividade
#     ${resgeral_sinistralidade}             Listar arquivos csv    diretorio=${dir}    nome_arquivo=resgeral_sinistralidade
#     ${resgeral_utilizacao}                 Listar arquivos csv    diretorio=${dir}    nome_arquivo=resgeral_utilizacao

#     # Arquivo Leitura de arquivos
#     ${coluna_1_utilizacao}        ${coluna_2_utilizacao}    ${coluna_3_utilizacao}       Ler arquivo csv - Indicadores Gerais - 3 Colunas   arquivo=${dir}/${resgeral_utilizacao}      validador=${False}
#     ${coluna_1_representatividade}             ${coluna_2_representatividade}    ${coluna_3_representatividade}                                      Ler arquivo csv - Indicadores Gerais - 3 Colunas   arquivo=${dir}/${resgeral_representatividade}      validador=${True}        
#     ${coluna_1_perfilpopulacional}        ${coluna_2_perfilpopulacional}                                  Ler arquivo csv - Indicadores Gerais - 2 Colunas   arquivo=${dir}/${resgeral_perfilpopulacional}      validador=${True}   
#     ${coluna_1_sinistralidade}       ${coluna_2_sinistralidade}                                 Ler arquivo csv - Indicadores Gerais - 2 Colunas   arquivo=${dir}/${resgeral_sinistralidade}       validador=${True}        

#     # Excluir arquivos
#     Remove Files    ${dir}/${resgeral_perfilpopulacional}    
#     ...             ${dir}/${resgeral_representatividade}    
#     ...             ${dir}/${resgeral_sinistralidade}    
#     ...             ${dir}/${resgeral_utilizacao}
#     ...             ${zip_file}
#     Remove Directory    ${dir}
#     Remove Directory    ${raiz}   

#     Capturar e Validar tabela - Resumo de Indicadores - Gerais - 2 Colunas    ${coluna_1_perfilpopulacional}        ${coluna_2_perfilpopulacional}     table01
#     Capturar e Validar tabela - Resumo de Indicadores - Gerais - 2 Colunas    ${coluna_1_sinistralidade}            ${coluna_2_sinistralidade}         table02    
#     Capturar e Validar tabela - Resumo de Indicadores - Gerais - 3 Colunas    ${coluna_1_utilizacao}                ${coluna_2_utilizacao}    ${coluna_3_utilizacao}    table03
#     Capturar e Validar tabela - Resumo de Indicadores - Gerais - 3 Colunas    ${coluna_1_representatividade}             ${coluna_2_representatividade}        ${coluna_3_representatividade}    table04

# Validação de CSV - Resumo de Indicadores - Evolução Sinistralidade
#     [Tags]    csv
#     Navegação página Evolução Sinistralidade

#     ${file}    Set Variable        ${EXECDIR}/resource/download/resumo_financeiro.csv   
#     ${dir}     Set Variable        ${EXECDIR}/resource/download
    
#     # # Captura de arquivos
#     Fazer Download CSV    ${file}
        
#     # Arquivo Leitura de arquivos
#     ${lista_data}    ${lista_premio}    ${lista_sinistro}    ${lista_sinistralidade}    ${lista_copay}    Ler arquivo csv - Indicadores - Evolução Sinistralidade   arquivo=${file}

#     # Excluir arquivos
#     Remove Files    ${file}
#     Remove Directory    ${dir}
    
#     # Caputa de Tela e validação
#     Capturar e Validar tabela Resumo Financeiro - Resumo de Indicadores - Evolução Sinistralidade    ${lista_data}    ${lista_premio}    ${lista_sinistro}    ${lista_sinistralidade}    ${lista_copay}

# Validação de CSV - Resumo de Indicadores - Evolução Sinistralidade - Detalhado
#     [Tags]    csv
#     Navegação página Evolução Sinistralidade - Detalhado

#     ${file}    Set Variable        ${EXECDIR}/resource/download/financeiro_pre_detalhado.csv   
#     ${dir}     Set Variable        ${EXECDIR}/resource/download
    
#     # # Captura de arquivos
#     Fazer Download CSV    ${file}
        
#     # # Arquivo Leitura de arquivos
#     ${lista_data}    ${lista_premio}    
#     ...    ${lista_sinistro}    ${lista_copay}    
#     ...    ${lista_sinistralidade}    ${lista_vidas}    
#     ...    ${lista_sinistro_per_cap}    ${lista_premio_per_cap}    
#     ...    ${lista_copay_per_cap}    ${lista_lim_tec_mensal}    
#     ...    ${lista_exc_mensal}    ${lista_exc_acumulado}    Ler arquivo csv - Indicadores - Evolução Sinistralidade - Detalhado   arquivo=${file}

#     # Excluir arquivos
#     Remove Files    ${file}
#     Remove Directory    ${dir}
    
#     # # Caputa de Tela e validação
#     Capturar e Validar tabela Resumo Financeiro - Resumo de Indicadores - Evolução Sinistralidade - Detalhado    ${lista_data}    
#     ...    ${lista_premio}    
#     ...    ${lista_sinistro}    ${lista_copay}    
#     ...    ${lista_sinistralidade}    ${lista_vidas}    
#     ...    ${lista_sinistro_per_cap}    ${lista_premio_per_cap}    
#     ...    ${lista_copay_per_cap}    ${lista_lim_tec_mensal}    
#     ...    ${lista_exc_mensal}    ${lista_exc_acumulado}    


# Validação de CSV - Resumo de Indicadores - Evolução do Sinistro 
#     [Tags]    csv
#     Navegação página Evolução Sinistro
    
#     ${file}    Set Variable        ${EXECDIR}/resource/download/financeiro_pos.csv   
#     ${dir}     Set Variable        ${EXECDIR}/resource/download
    
#     # # Captura de arquivos
#     Fazer Download CSV    ${file}
        
#      # # Arquivo Leitura de arquivos
#     ${lista_data}       ${lista_vidas}    ${lista_sinistro}    ${lista_per_cap}    
#     ...    Ler arquivo csv - Indicadores - Evolução Sinistro    arquivo=${file}
    
#     # Excluir arquivos
#     Remove Files    ${file}
#     Remove Directory    ${dir}

#     # Caputa de Tela e validação
#     Capturar e Validar tabela Resumo Financeiro - Resumo de Indicadores - Evolução Sinistro    ${lista_data}       ${lista_vidas}    ${lista_sinistro}    ${lista_per_cap}
       
# SETUP - Validação de CSV - Resumo de Indicadores - Sinistralidade Período Reajuste e Indicadores Gerais por Mês
#     [Tags]    csv 
#     Navegação página Configuração
#     Configurar empresa    ${Empresa_7}
#     Validar empresa configurada    ${Empresa_7}

# Validação da Navegação para Relatórios - Resumo de Indicadores - Sinistralidade Período Reajuste
#     [Tags]    csv
#     Navegação página Sinistralidade Período Reajuste

#     ${file}    Set Variable        ${EXECDIR}/resource/download/analise_reajuste.csv   
#     ${dir}     Set Variable        ${EXECDIR}/resource/download
    
#     # # Captura de arquivos
#     Fazer Download CSV    ${file}

#     # #Arquivo Leitura de arquivos - Tabela
#     ${coluna_1_tabela}       ${coluna_2_tabela}    ${coluna_3_tabela}    ${coluna_4_tabela}    
#     ...    Ler arquivo csv - Resumo de Indicadores - Sinistralidade Período Reajuste - Tabela    arquivo=${file}

#     ${coluna_1_info}       ${coluna_2_info}    ${coluna_3_info}    ${coluna_4_info}    ${coluna_5_info}            
#     ...    Ler arquivo csv - Resumo de Indicadores - Sinistralidade Período Reajuste - Info    arquivo=${file}

#     # # Excluir arquivos
#     Remove Files    ${file}
#     Remove Directory    ${dir}
     
#     # Caputa de Tela e validação
#     Capturar e Validar tabela Resumo Financeiro - Resumo de Indicadores - Sinistralidade Período Reajuste - Tabela
#     ...     ${coluna_1_tabela}       ${coluna_2_tabela}    ${coluna_3_tabela}    ${coluna_4_tabela}    

#     Capturar e Validar tabela Resumo Financeiro - Resumo de Indicadores - Sinistralidade Período Reajuste - Info    
#     ...    ${coluna_1_info}       ${coluna_2_info}    ${coluna_3_info}    ${coluna_4_info}    ${coluna_5_info}

# Validação de CSV - Resumo de Indicadores - Indicadores Gerais por Mês
#     [Tags]    csv
#     Navegação página Resumo Indicadores Gerais por Mes
    
#     ${file}    Set Variable        ${EXECDIR}/resource/download/indicadores_gerais_mes.csv   
#     ${dir}     Set Variable        ${EXECDIR}/resource/download
    
#     # # Captura de arquivos
#     Fazer Download CSV    ${file}
        
#     # Arquivo Leitura de arquivos
#     ${coluna_1}    ${coluna_2}    ${coluna_3}    ${coluna_4}    ${coluna_5}    ${coluna_6}    ${coluna_7}    ${coluna_8}     Ler arquivo csv - Resumo Indicadores - Indicadores Gerais por Mes   arquivo=${file}

#     # Excluir arquivos
#     Remove Files    ${file}
#     Remove Directory    ${dir}
    
#     # Caputa de Tela e validação
#     Capturar e Validar tabela Resumo Indicadores - Indicadores Gerais por Mês   ${coluna_1}    ${coluna_2}    ${coluna_3}    ${coluna_4}    ${coluna_5}    ${coluna_6}    ${coluna_7}    ${coluna_8}

# SETUP - Validação de CSV - Resumo de Indicadores - Sinistro por Subestipulante 
#      [Tags]    csv
#      Navegação página Configuração
#      Configurar empresa    ${Empresa_1}
#      Validar empresa configurada    ${Empresa_1}

# Validação da Navegação para Relatórios - Resumo de Indicadores - Sinistro por Subestipulante 
#     [Tags]    csv
#     Navegação página Sinistro por Subestipulante

#     ${zip_file}    Set Variable            ${EXECDIR}/resource/download/financeiro_subestipulante.zip   
#     ${dir}         Set Variable            ${EXECDIR}/resource/download/resumo_sinistro_subestipulante
#     ${raiz}        Set Variable            ${EXECDIR}/resource/download

#     # # Captura de arquivos
#     Fazer Download CSV    ${zip_file}
#     Unzip arquivo   ${zip_file}     ${dir}

#     # # Listando Arquivos
#     ${resfinanceiro_sub_gra}                           Listar arquivos csv    diretorio=${dir}    nome_arquivo=resfinanceiro_sub_gra
#     ${resumo_sinistro_subestipulante_tabela}         Listar arquivos csv    diretorio=${dir}    nome_arquivo=resumo_financeiro_subestipulante_tabela
    
#     ${coluna_1_tabela}       ${coluna_2_tabela}    ${coluna_3_tabela}    ${coluna_4_tabela}    Ler arquivo csv - Resumo de Indicadores - Sinistro por Subestipulante    arquivo=${dir}/${resumo_sinistro_subestipulante_tabela}

#     # Excluir arquivos
#     Remove Files    ${dir}/${resfinanceiro_sub_gra}    
#     ...             ${dir}/${resumo_sinistro_subestipulante_tabela}    
#     ...             ${zip_file}
#     Remove Directory    ${dir}
#     Remove Directory    ${raiz}       

#     Capturar e Validar tabela Resumo de Indicadores - Sinistro por Subestipulante    ${coluna_1_tabela}       ${coluna_2_tabela}    ${coluna_3_tabela}    ${coluna_4_tabela}

# *** Comments ***
