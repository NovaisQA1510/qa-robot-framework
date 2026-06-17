*** Settings ***

# Bibliotecas
Library    Browser    auto_closing_level=KEEP
Library    CSVLibrary
Library    Collections
Library    OperatingSystem
Library    String

# Resources
Resource    ../../../envs/env_local.resource
Resource    gerenciamento_sessao.resource
Resource    utils.resource
Resource    gerenciamento_arquivo/gerenciamento_arquivo.resource

# Data
Resource    ../data/massa_de_dados_empresa.resource

# Menus Resource
Resource    ../locators/menus.resource

# Pages Resource
Resource    ../pages/configuracao/page_configuracao.resource
Resource    ../pages/configuracao/page_gerenciar_notas_e_documentacao.resource
Resource    ../pages/configuracao/page_gerenciar_agrupamentos.resource
Resource    ../pages/configuracao/page_empresas.resource
Resource    ../pages/configuracao/page_acompanhamento.resource
Resource    ../pages/configuracao/page_copay.resource
Resource    ../pages/configuracao/page_importacao_de_dados.resource
Resource    ../pages/configuracao/page_modelos_genericos.resource
Resource    ../pages/configuracao/page_vidas.resource
Resource    ../pages/configuracao/page_anotacoes.resource
Resource    ../pages/configuracao/page_lista_powerbi.resource
Resource    ../pages/relatorios/indicadores_demograficos/page_perfil_demografico.resource
Resource    ../pages/relatorios/indicadores_demograficos/page_evolucao_de_vidas.resource
Resource    ../pages/relatorios/resumo_de_indicadores/page_evolucao_de_sinistralidade.resource
Resource    ../pages/relatorios/resumo_de_indicadores/page_evolucao_do_sinistro.resource
Resource    ../pages/relatorios/evolucoes_de_sinistro/page_evolucao_por_plano.resource
Resource    ../pages/relatorios/sinistros_agregados/page_tipo_de_evento.resource
Resource    ../pages/relatorios/rede_x_reembolso/page_evolucao_por_metricas.resource
Resource    ../pages/relatorios/prestadores/page_geral.resource
Resource    ../pages/relatorios/utilizacao_individual/page_maiores_utilizadores.resource
Resource    ../pages/relatorios/utilizacao_individual/page_maiores_utilizadores_mes.resource
Resource    ../pages/dados_completos/page_dados_completos.resource

# Locators Resource
Resource    ../locators/configuracao/locator_configuracao.resource
Resource    ../locators/configuracao/locator_gerenciar_notas_e_documentacao.resource
Resource    ../locators/configuracao/locator_gerenciar_agrupamentos.resource
Resource    ../locators/configuracao/locator_empresas.resource
Resource    ../locators/configuracao/locator_acompanhamento.resource
Resource    ../locators/configuracao/locator_copay.resource
Resource    ../locators/configuracao/locator_importacao_de_dados.resource
Resource    ../locators/configuracao/locator_modelos_genericos.resource
Resource    ../locators/configuracao/locator_vidas.resource
Resource    ../locators/configuracao/locator_anotacoes.resource
Resource    ../locators/configuracao/locator_lista_powerbi.resource
Resource    ../locators/relatorios/indicadores_demograficos/locator_perfil_demografico.resource
Resource    ../locators/relatorios/indicadores_demograficos/locator_evolucao_de_vidas.resource
Resource    ../locators/relatorios/resumo_de_indicadores/locator_evolucao_de_sinistralidade.resource
Resource    ../locators/relatorios/resumo_de_indicadores/locator_evolucao_do_sinistro.resource
Resource    ../locators/relatorios/evolucoes_de_sinistro/locator_evolucao_por_plano.resource
Resource    ../locators/relatorios/sinistros_agregados/locator_tipo_de_evento.resource
Resource    ../locators/relatorios/rede_x_reembolso/locator_evolucao_por_metricas.resource
Resource    ../locators/relatorios/prestadores/locator_geral.resource
Resource    ../locators/relatorios/utilizacao_individual/locator_maiores_utilizadores.resource
Resource    ../locators/relatorios/utilizacao_individual/locator_maiores_utilizadores_mes.resource
Resource    ../locators/dados_completos/locator_dados_completos.resource

#novo relatório locator eddie
Resource    ../locators/relatorios/sinistros_agregados/locator_especialidades.resource

#novo relatório page eddie
Resource    ../pages/relatorios/sinistros_agregados/page_especialidade.resource



# Python methods
Library    gerenciamento_arquivo/gerenciamento_arquivo.py    

# Pages Menus Ocultos 
Resource    ../pages/menus_ocultos/page_gerenciar_notas_e_documentacao.resource