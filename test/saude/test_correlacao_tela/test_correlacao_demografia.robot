*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
SETUP - Validação de CSV - Demografia
    [Tags]    correlacao-tela
    Navegação página Configuração
    Configurar empresa    ${Empresa_8}
    Validar empresa configurada    ${Empresa_8}

Validação Demografia - Perfil Demografico + Evolução de vidas por plano
    [Tags]    correlacao-tela
    [Documentation]    Em Perfil populacional: Vidas no último mês (microdados) 
    ...                deve ser igual a
    ...                Evolução de vidas por plano: total do último mês de referência
    
    Navegação página Perfil Demografico
    ${elemento_1_perfil_populacional}    Capturar elemento de tabela do BI    table_id=table01     elemento=Vidas no último mês (microdados)    coluna=2

    Navegação página Evolução de Vidas por Plano
    ${elemento_1_evolucao_vidas}    Capturar elemento de tabela do BI    table_id=table01     elemento=TOTAL   coluna=2

    Should Be Equal    ${elemento_1_perfil_populacional}    ${elemento_1_evolucao_vidas}

Validação Demografia - Perfil Demografico + Evolução de Vidas
    [Tags]    correlacao-tela    bug
    [Documentation]    Em Perfil populacional - Vidas último mês (gerencial) = Evolução Populacional - último mês de referência ///
    ...                Em Perfil populacional - Media de Vidas dos meses = Evolução Populacional - Media dos meses ///
    ...                Em Perfil populacional - % Crescimento dos meses = Evolução Populacional - % Media dos meses ///
    
    Navegação página Perfil Demografico
    ${elemento_1_perfil_populacional}    Capturar elemento de tabela do BI    table_id=table01    elemento=Vidas no último mês (gerencial)   coluna=2
    ${elemento_2_perfil_populacional}    Capturar elemento de tabela do BI    table_id=table01    elemento=Média de Vidas (12 meses)   coluna=2
    ${elemento_3_perfil_populacional}    Capturar elemento de tabela do BI    table_id=table01    elemento=% Crescimento (12 meses)   coluna=2

    Navegação página Evolução de Vidas
    ${elemento_1_evolucao_populacional}    Capturar elemento de tabela do BI    table_id=table01    elemento=0${Empresa_8}[periodo_fim]    coluna=2
    ${elemento_2_evolucao_populacional}    Capturar elemento de tabela do BI    table_id=table01    elemento=MÉDIA    coluna=2
    ${elemento_3_evolucao_populacional}    Capturar elemento de tabela do BI    table_id=table01    elemento=MÉDIA    coluna=3

    Should Be Equal    ${elemento_1_perfil_populacional}    ${elemento_1_evolucao_populacional}
    Should Be Equal    ${elemento_2_perfil_populacional}    ${elemento_2_evolucao_populacional}
    Should Be Equal    ${elemento_3_perfil_populacional}    ${elemento_3_evolucao_populacional}    # BUG

*** Comments ***
- BUGs
Validação Demografia - Perfil Demografico + Evolução de Vidas -> Notaçào de porcentagem errada: 1,42 != + 1.42%








