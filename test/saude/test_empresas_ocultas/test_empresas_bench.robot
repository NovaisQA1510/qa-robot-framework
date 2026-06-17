*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup       Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão
Test Template     Validação status da empresa oculta

*** Test Cases ***
Teste - Validação status da empresa oculta - True - Empresa: Socializa Empreendimentos
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_1}

Teste - Validação status da empresa oculta - True - Empresa: MDC PAR e ERB (Grupo) (Corretora ENSEN) 
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_2}

Teste - Validação status da empresa oculta - True - Empresa: Instituto Lemann Corretora SMB 
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_3}

Teste - Validação status da empresa oculta - True - Empresa: SUNO United Creators 
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_4}

Teste - Validação status da empresa oculta - True - Empresa: Galcorr
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_5}

Teste - Validação status da empresa oculta - True - Empresa: Crc Evans Pih Serviços de Tubulação 
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_6}

Teste - Validação status da empresa oculta - True - Empresa: CK Amorim Comercio de Artefatos de Metais
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_7}

Teste - Validação status da empresa oculta - True - Empresa: Alper
    [Tags]    empresas_ocultas    not_ready  
    ${True}    ${Empresa_oculta_8}

Teste - Validação status da empresa oculta - True - Empresa: DPaschoal
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_9}    

Teste - Validação status da empresa oculta - True - Empresa: Sindicato da Borracha de Americana (Goodyear)
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_10}   

Teste - Validação status da empresa oculta - True - Empresa: Enerflex Energia
    [Tags]    empresas_ocultas    not_ready 
    ${True}    ${Empresa_oculta_11}   

Teste - Validação status da empresa oculta - True - Empresa: LMENG CONSULTORIA PROJETOS ENGENHARIA
    [Tags]    empresas_ocultas    not_ready   
    ${True}    ${Empresa_oculta_12}

Teste - Validação status da empresa oculta - True - Empresa: Centro de Olhos de Niterói
    [Tags]    empresas_ocultas    not_ready 
    ${True}    ${Empresa_oculta_13}

Teste - Validação status da empresa oculta - True - Ignis Contábil
    [Tags]    empresas_ocultas    not_ready 
    ${True}    ${Empresa_oculta_14}

Teste - Validação status da empresa oculta - True - SINDAERGS
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_15}

Teste - Validação status da empresa oculta - True - MELNICK EVEN DESENVOLVIMENTO IMOBILIARIO S.A
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_16}

Teste - Validação status da empresa oculta - True - POATEK INFORMATICA
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_17}

Teste - Validação status da empresa oculta - True - DTI SISTEMAS
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_18}

Teste - Validação status da empresa oculta - True - Gencau
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_19}


Teste - Validação status da empresa oculta - True - Unico (Acesso Digital)
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_26}

Teste - Validação status da empresa oculta - True - Modulo Security Solutions
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_27}

Teste - Validação status da empresa oculta - True - Edscha/Gestamp
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_28}

Teste - Validação status da empresa oculta - True - Mirasol Transporte e Armazenagem
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_29}

Teste - Validação status da empresa oculta - True - Quinto Apoio Administrativo
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_oculta_30}

Teste - Validação status da empresa oculta - True - Fundação José Silveira
    [Tags]    empresas_ocultas    test
    ${True}    ${Empresa_oculta_31}

Teste - Validação status da empresa oculta - True - COOPERATIVA DE CREDITO COOPLIVRE - Grupo BC Life
    [Tags]    empresas_ocultas    test
    ${True}    ${Empresa_oculta_32}

Teste - Validação status da empresa oculta - True - CTC CENTRO DE TECNOLOGIA CANAVIEIRA - Grupo BC Life
    [Tags]    empresas_ocultas    test
    ${True}    ${Empresa_oculta_33}


Teste - Validação status da empresa oculta - True - Empresa 2
    [Tags]    empresas_ocultas    not_ready
    ${True}    ${Empresa_2}

*** Keywords ***
# TEMPLATE
Validação status da empresa oculta
    [Arguments]    ${status}    ${empresa}
    
    # Configurar uma empresa padrão pra Validar empresas de saúde
    Configuração de Empresa de Saúde    ${Empresa_2} 

    # Validação empresa existe no menu: Labs - Benchmark Geral
    Navegação página Labs Benchmark Geral
    Validação de Empresa Existente em: Labs - Benchmark Geral    ${status}    ${empresa}

    # Validação empresa existe no menu: Labs - Benchmark Por Prestador
    Navegação página Labs Benchmark Por Prestador
    Validação de Empresa Existente em: Labs - Benchmark Por Prestador    ${status}   ${empresa}
        
    # # Validação empresa existe no menu: Labs - Benchmark Por Procedimento
    Navegação página Labs Benchmark Por Procedimento
    Validação de Empresa Existente em: Labs - Benchmark Por Procedimento    ${status}    ${empresa}

# HELPER KYDs
Configuração de Empresa de Saúde
    [Arguments]    ${empresa}
    Navegação página Configuração
    Configurar empresa    ${empresa}
    Validar empresa configurada    ${empresa} 

*** Comments ***