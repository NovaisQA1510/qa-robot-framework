*** Variables ***
# Home
${mnu_home_page}                                 xpath=*//a[@href="/site"]

# Configuração
${mnu_configuracao}                              css=a[title="Seção para Otimização das Opções do Usuário"]
${mnu_configuracao_configuracao}                 xpath=*//li[@title="Configura parâmetros para visualização dos relatórios no sistema, como período e operadora."]
${mnu_configuracao_gerenciar_agrupamento}        xpath=*//li[@title="Gerenciar Agrupamentos"]
${mnu_configuracao_empresas}                     xpath=*//li[@title="Apresenta as opções de inclusão, exclusão e alteração de uma empresa no sistema."]
${mnu_configuracao_acompanhamento}               xpath=*//li[@title="Apresenta as opções de inclusão, exclusão e edição de Programas de Acompanhamento do sistema."]
${mnu_configuracao_CoPay}                        xpath=//a[contains(text(),"CoPay")]
${mnu_configuracao_importacao_de_dados}          xpath=//a[contains(text(),"Importação de Dados")]
${mnu_configuracao_modelos_genericos}            xpath=//a[contains(text(),"Modelos Genéricos")]
${mnu_configuracao_vidas}                        xpath=//a[contains(text(),"Vidas por Grupo de Faturamento")]
${mnu_configuracao_anotacoes}                    xpath=//a[contains(text(),"Anotações")]
${mnu_configuracao_lista_powerBI}                xpath=//a[contains(text(),"Lista PowerBI")]


# Relatórios    
${mnu_relatorio}                                                                xpath=//a[@title="Seção de Relatórios Montados para Melhor Visualização de Diversos tipos de Dados da Empresa"]
${mnu_relatorio_indicadores_demograficos_perfil_demografico}                    xpath=//a[@title="Apresenta os principais componentes da distribuição demográfica: faixa etária, sexo e titularidade."]
${mnu_relatorio_indicadores_demograficos_evolucao_de_vidas}                     xpath=//a[@title="Apresenta a evolução do número de vidas mês-a-mês."]
${mnu_relatorio_resumo_de_indicadores_evolucao_de_sinistralidade}               xpath=//a[@title="Evolução mês-a-mês dos valores de Prêmio, Sinistro e Sinistralidade da apólice. Visualização destinada a contratos pré-pagamento."]
${mnu_relatorio_resumo_de_indicadores_evolucao_do_sinistro}                     xpath=//a[@title="Evolução mês-a-mês dos valores de Sinistro, Vidas e Sinistro per capita. Visualização destinada a contratos pós pagamento."]
${mnu_relatorio_sinistros_agregados_tipo_de_evento}                             xpath=//a[@title="Apresenta o valor do sinistro, o valor médio e a representatividade do sinistro por tipo de evento."]
${mnu_relatorio_evolucoes_de_sinistro_evolucao_por_plano}                       xpath=//a[@title="Evolução mês-a-mês do sinistro por plano."]
${mnu_relatorio_rede_x_reembolso_evolucao_por_metricas}                         xpath=//a[@title="Evolução mês-a-mês do custo médio de procedimentos realizados em rede ou reembolso. Possibilidade de filtro por tipo de evento e por métrica."]
${mnu_relatorio_prestadores_geral}                                              xpath=//a[@title="Ranking de prestadores em ordem decrescente de sinistro total. Apresenta as informações de valor mínimo, máximo e médio de sinistro por prestador, bem como quantidade de eventos e representatividade no sinistro total. Possibilidade de filtro por tipo de evento."]
${mnu_relatorio_utilizacao_indidual_maiores_utilizadores}                       xpath=//a[@title="Listagem de beneficiários em ordem decrescente do custo associado no período total. Os custos são apresentados mês a mês."]
${mnu_relatorio_utilizacao_indidual_maiores_utilizadores_do_mes}                xpath=//a[@title="Listagem de beneficiários em ordem decrescente do custo associado do último mês de análise do período. Os custos são apresentados mês a mês."]
${mnu_relatorio_sinistros_agregados_especialidades}                             xpath=//a[@title="Relatório com Dados de Sinistro por Especialidade de Evento"]

# Dados Completos
${mnu_dados_completos}                                 xpath=*//a[@title="Link para Tabela de Entregas de Dados Armazenados no BI"] 

# Menus Ocultos 
${mnu_configuracao_gerenciar_notas}                    xpath=*//li[@title="Gerenciar notas e documentações relacionadas a contratos com operadoras, aditivos, reajustes, políticas de benefícios."]
