*** Settings ***
Resource    ../../../resource/saude/utils/base.resource

Suite Setup        Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
SETUP - Validação de CSV - Demografia + Resumo de Indicadores
    [Tags]    correlacao-tela     
    Navegação página Configuração
    Configurar empresa    ${Empresa_8}
    Validar empresa configurada    ${Empresa_8}

Validação Demografia - (Demografia) Perfil Demografico + (Resumo de Indicadores) Indicadores Gerais
    [Tags]    correlacao-tela
    [Documentation]     Tela Perfil Populacional 		      > 	       Tela Indicadores Gerais
    ...                     Vidas no último mês (microdados)		       Vidas atuais
    ...                     3.935						                   3.935

    Navegação página Perfil Demografico
    ${elemento_1_perfil_populacional}    Capturar elemento de tabela do BI    table_id=table01     elemento=Vidas no último mês (microdados)    coluna=2

    Navegação página Resumo Indicadores Gerais
    ${elemento_1_indicadores_gerais}    Capturar elemento de tabela do BI    table_id=table01    elemento=Vidas atuais    coluna=2    erro_linha=${True}    correcao=-1

    Should Be Equal    ${elemento_1_perfil_populacional}    ${elemento_1_indicadores_gerais}

Validação Demografia - (Demografia) Perfil Demografico + (Resumo de Indicadores) Indicadores Gerais por Mês
    [Tags]    correlacao-tela 
    [Documentation]     Tela Perfil Populacional		>	Tela Indicadores Gerais por Mês	
    ...	                Vidas no último mês (gerencial)			Vidas Cobertas
    ...                3.225						            3.225 ultimo mês (Jun/2024)

    Navegação página Perfil Demografico
    ${elemento_1_perfil_populacional}    Capturar elemento de tabela do BI    table_id=table01     elemento=Vidas no último mês (gerencial)    coluna=2


    Navegação página Resumo Indicadores Gerais por Mes
    ${elemento_1_indicadores_gerais_mes}    Capturar elemento de tabela do BI - buscando 2 elementos    table_id=table01    elemento_linha=Vidas Cobertas    elemento_coluna=Jun/2024

    Should Be Equal    ${elemento_1_perfil_populacional}    ${elemento_1_indicadores_gerais_mes}

Validação Demografia - (Demografia) Perfil Demografico + (Resumo de Indicadores) Evolução Sinistro
    [Tags]    correlacao-tela
    [Documentation]        Tela Perfil Populacional	            >     Tela Financeiro (Pos)        	    
    ...                    Vidas no último mês (microdados)           Total Vidas					        
    ...                    3.935						              3.935

    Navegação página Perfil Demografico
    ${elemento_1_perfil_populacional}    Capturar elemento de tabela do BI    table_id=table01     elemento=Vidas no último mês (microdados)    coluna=2

    Navegação página Evolução Sinistro
    ${elemento_1_resumo_pos}    Capturar elemento de tabela do BI    table_id=table01    elemento=06/2024    coluna=2

    Should Be Equal    ${elemento_1_perfil_populacional}    ${elemento_1_resumo_pos}

Validação Demografia - (Resumo de Indicadores) Indicadores Gerais + (Resumo de Indicadores) Evolução Sinistralidade
    [Tags]    correlacao-tela 
    # Tela Indicadores Gerais			>	Tela Financeiro (Pré)
    # Sinistralidade					% Sinistralidade (total)
    # 72,31%						            72,31%

    # Tela Indicadores Gerais			>	Tela Financeiro (Pré) 
    # Copay						Copay (R$) (total)
    # 773.206,02					      773.206,02

    # Tela Indicadores Gerais			>	Tela Financeiro (Pré)
    # Sinistro (R$)					Sinistro (R$)	(total)
    # 8.635.628,54					8.635.628,54

    # Tela Indicadores Gerais			>	Tela Financeiro (Pré)
    # Prêmio (R$)					Prêmio (R$)	(total)
    # 11.169.971,29					11.169.971,29	

    Navegação página Resumo Indicadores Gerais
    ${elemento_1_indicadores_gerais}    Capturar elemento de tabela do BI    table_id=table02    elemento=Sinistralidade (%)    coluna=2    erro_linha=${True}    correcao=-1
    ${elemento_2_indicadores_gerais}    Capturar elemento de tabela do BI    table_id=table02    elemento=Copay                 coluna=2    erro_linha=${True}    correcao=-1
    ${elemento_3_indicadores_gerais}    Capturar elemento de tabela do BI    table_id=table02    elemento=Sinistro (R$)         coluna=2    erro_linha=${True}    correcao=-1
    ${elemento_4_indicadores_gerais}    Capturar elemento de tabela do BI    table_id=table02    elemento=Prêmio (R$)           coluna=2    erro_linha=${True}    correcao=-1
    
    Navegação página Evolução Sinistralidade
    ${elemento_1_financeiro_pre}    Capturar elemento de tabela do BI   table_id=table01    elemento=TOTAL    coluna=5
    ${elemento_2_financeiro_pre}    Capturar elemento de tabela do BI    table_id=table01    elemento=TOTAL    coluna=4
    ${elemento_3_financeiro_pre}    Capturar elemento de tabela do BI    table_id=table01    elemento=TOTAL    coluna=3
    ${elemento_4_financeiro_pre}    Capturar elemento de tabela do BI    table_id=table01    elemento=TOTAL    coluna=2

    Should Be Equal    ${elemento_1_indicadores_gerais}    ${elemento_1_financeiro_pre}    
    Should Be Equal    ${elemento_2_indicadores_gerais}    ${elemento_2_financeiro_pre}    
    Should Be Equal    ${elemento_3_indicadores_gerais}    ${elemento_3_financeiro_pre}    
    Should Be Equal    ${elemento_4_indicadores_gerais}    ${elemento_4_financeiro_pre}    

Validação Demografia - (Resumo de Indicadores) Evolução Sinistro + (Resumo de Indicadores) Financeiro por Subestipulante
    [Tags]    correlacao-tela   

    # ????? Tela Financeiro (Pos)		>	Tela Financeiro por Subestipulante 
    # Medias						Medias
    # vidas/sinistro/percapita			vidas/sinistro/percapita	
    # 40.308	37.734.121,25	936,15			40.308	37.734.121,25	936,15


    Navegação página Evolução Sinistro
    ${elemento_1_financeiro_pos}    Capturar elemento de tabela do BI    table_id=table01    elemento=MÉDIAS    coluna=2
    ${elemento_2_financeiro_pos}    Capturar elemento de tabela do BI    table_id=table01    elemento=MÉDIAS    coluna=3
    ${elemento_3_financeiro_pos}    Capturar elemento de tabela do BI    table_id=table01    elemento=MÉDIAS    coluna=4
    
    Navegação página Sinistro por Subestipulante
    ${elemento_1_financeiro_subestipulante}    Capturar elemento de tabela do BI   table_id=table01    elemento=MÉDIAS    coluna=2
    ${elemento_2_financeiro_subestipulante}    Capturar elemento de tabela do BI    table_id=table01    elemento=MÉDIAS    coluna=3
    ${elemento_3_financeiro_subestipulante}    Capturar elemento de tabela do BI    table_id=table01    elemento=MÉDIAS    coluna=4

    Should Be Equal    ${elemento_1_financeiro_pos}    ${elemento_1_financeiro_subestipulante}    
    Should Be Equal    ${elemento_2_financeiro_pos}    ${elemento_2_financeiro_subestipulante}    
    Should Be Equal    ${elemento_3_financeiro_pos}    ${elemento_3_financeiro_subestipulante}    

*** Comments ***