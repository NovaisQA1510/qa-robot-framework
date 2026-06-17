*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação para Relatórios - Evolucao de Sinistralidade
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_resumo_de_indicadores_evolucao_de_sinistralidade}
    
    # Validação
    Wait For Elements State    ${evolucao_de_sinistralidade_lbl_resumo_financeiro}   state=visible
    Wait For Elements State    ${evolucao_do_sinistro_btn_csv}    state=visible
    