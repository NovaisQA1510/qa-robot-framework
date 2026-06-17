*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Acompanhamento
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_acompanhamento}
    
    # Validação
    Wait For Elements State    ${config_acompanhamento_lbl_programa_acompanhamento}   state=visible
    Wait For Elements State    ${config_acompanhamento_btn_criar_programa}    state=visible
    Wait For Elements State    ${erro_CDbException}    state=detached
    Wait For Elements State    ${erro_php_traces}    state=detached