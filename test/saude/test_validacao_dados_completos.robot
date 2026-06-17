*** Settings ***
Resource    ../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Validação de Dados Completos - Mais de 1 milhão de linhas
    [Tags]    dados_completos
    Navegação página Configuração
    Configurar empresa    ${Empresa_6}
    Validar empresa configurada    ${Empresa_6} 
    Navegação página Dados Completos
    Realizar Dowload de dados completos - Pessoas     ${True}
    Realizar Dowload de dados completos - Eventos     ${True}

Validação de Dados Completos - Menos de 1 milhão de linhas
    [Tags]    dados_completos
    Navegação página Configuração
    Configurar empresa    ${Empresa_5}
    Validar empresa configurada    ${Empresa_5} 
    Navegação página Dados Completos
    Realizar Dowload de dados completos - Pessoas      ${False}
    Realizar Dowload de dados completos - Eventos      ${False}