*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Gerenciar Agrupamentos
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_gerenciar_agrupamento}
    
    # Validação
    Wait For Elements State    ${config_gestao_agrupamento_lbl_gestao}   state=visible
    Wait For Elements State    ${config_gestao_agrupamento_btn_novo_agrupamento}    state=visible
    Wait For Elements State    ${erro_CDbException}    state=detached
    Wait For Elements State    ${erro_php_traces}    state=detached