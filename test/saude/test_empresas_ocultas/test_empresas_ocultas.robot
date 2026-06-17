*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup       Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão
Test Template     Validação status da empresa oculta

*** Test Cases ***
Teste - Validação status da empresa oculta - False - Empresa: Socializa Empreendimentos
    [Tags]    empresas_ocultas    not_ready
    ${False}    ${Empresa_oculta_1}

Teste - Validação status da empresa oculta - False - Empresa: MDC PAR e ERB (Grupo) (Corretora ENSEN) 
    [Tags]    empresas_ocultas    not_ready
    ${False}    ${Empresa_oculta_2}

Teste - Validação status da empresa oculta - False - Empresa: Instituto Lemann Corretora SMB 
    [Tags]    empresas_ocultas    not_ready
    ${False}    ${Empresa_oculta_3}

Teste - Validação status da empresa oculta - False - Empresa: SUNO United Creators 
    [Tags]    empresas_ocultas    not_ready
    ${False}    ${Empresa_oculta_4}

Teste - Validação status da empresa oculta - False - Empresa: Galcorr
    [Tags]    empresas_ocultas    not_ready
    ${False}    ${Empresa_oculta_5}

Teste - Validação status da empresa oculta - False - Empresa: Crc Evans Pih Serviços de Tubulação 
    [Tags]    empresas_ocultas    not_ready
    ${False}    ${Empresa_oculta_6}

Teste - Validação status da empresa oculta - False - Empresa: CK Amorim Comercio de Artefatos de Metais
    [Tags]    empresas_ocultas    not_ready
    ${False}    ${Empresa_oculta_7}

Teste - Validação status da empresa oculta - False - Empresa: Alper
    [Tags]    empresas_ocultas    not_ready   
    ${False}    ${Empresa_oculta_8}

Teste - Validação status da empresa oculta - False - Empresa: DPaschoal
    [Tags]    empresas_ocultas    not_ready   
    ${False}    ${Empresa_oculta_9}    

Teste - Validação status da empresa oculta - False - Empresa: Sindicato da Borracha de Americana (Goodyear)
    [Tags]    empresas_ocultas    not_ready
    ${False}    ${Empresa_oculta_10}   

Teste - Validação status da empresa oculta - False - Empresa: Enerflex Energia
    [Tags]    empresas_ocultas    not_ready
    ${False}    ${Empresa_oculta_11}   

Teste - Validação status da empresa oculta - False - Empresa: LMENG CONSULTORIA PROJETOS ENGENHARIA
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_12}

Teste - Validação status da empresa oculta - False - Empresa: Centro de Olhos de Niterói
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_13}

Teste - Validação status da empresa oculta - False - Ignis Contábil
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_14}

Teste - Validação status da empresa oculta - False - SINDAERGS
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_15}

Teste - Validação status da empresa oculta - False - MELNICK EVEN DESENVOLVIMENTO IMOBILIARIO S.A
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_16}

Teste - Validação status da empresa oculta - False - POATEK INFORMATICA
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_17}

Teste - Validação status da empresa oculta - False - DTI SISTEMAS
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_18}

Teste - Validação status da empresa oculta - False - Gencau
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_19}


Teste - Validação status da empresa oculta - False - Unico (Acesso Digital)
    [Tags]    empresas_ocultas    not_ready
    ${False}    ${Empresa_oculta_26}

Teste - Validação status da empresa oculta - False - Modulo Security Solutions
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_27}

Teste - Validação status da empresa oculta - False - Edscha/Gestamp
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_28}

Teste - Validação status da empresa oculta - False - Mirasol Transporte e Armazenagem
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_29}

Teste - Validação status da empresa oculta - False - Quinto Apoio Administrativo
    [Tags]    empresas_ocultas    not_ready 
    ${False}    ${Empresa_oculta_30}

Teste - Validação status da empresa oculta - False - Fundação José Silveira
    [Tags]    empresas_ocultas    not_ready
    ${False}    ${Empresa_oculta_31}

Teste - Validação status da empresa oculta - False - COOPERATIVA DE CREDITO COOPLIVRE - Grupo BC Life
    [Tags]    empresas_ocultas     test
    ${False}    ${Empresa_oculta_32}

Teste - Validação status da empresa oculta - False - CTC CENTRO DE TECNOLOGIA CANAVIEIRA - Grupo BC Life
    [Tags]    empresas_ocultas    test
    ${False}    ${Empresa_oculta_33}

Teste - Validação status da empresa oculta - True - Empresa 2
    [Tags]    empresas_ocultas    test
    ${True}    ${Empresa_2}

*** Keywords ***
# TEMPLATE
Validação status da empresa oculta
    [Arguments]    ${status}    ${empresa}
    
    # Configurar uma empresa padrão pra Validar empresas de saúde
    Configuração de Empresa de Saúde    ${Empresa_2} 

    # Validação empresa existe no menu: Configuração - Configuração 
    Navegação página Configuração
    Validação de Empresa Existente em: Configuração - Configuração     ${status}    ${empresa}

    # Validação empresa existe no menu: Configuração - Empresas
    Navegação página Empresas
    Validação de Empresa Existente em: Configuração - Empresas     ${status}    ${empresa}

    # Validação empresa existe no menu: Configuração - Importação de Dados
    Navegação página Importação de Dados
    Validação de Empresa Existente em: Configuração - Importação de Dados       ${status}    ${empresa} 

    # Validação empresa existe no menu: Configuração - Vidas por Grupo de Faturamento
    Navegação página Vidas Por Grupo de Faturamento
    Validação de Empresa Existente em: Configuração - Vidas por Grupo de Faturamento       ${status}    ${empresa}

    # Validação empresa existe no menu: Configuração - Lista PowerBI
    Navegação página Power BI
    Validação de Empresa Existente em: Configuração - Lista PowerBI       ${status}    ${empresa}

    # Validação empresa existe no menu: Entregas
    Navegação página Entregas
    Validação de Empresa Existente em: Entregas    ${status}    ${empresa}

# HELPER KYDs
Configuração de Empresa de Saúde
    [Arguments]    ${empresa}
    Navegação página Configuração
    Configurar empresa    ${empresa}
    Validar empresa configurada    ${empresa} 

*** Comments ***