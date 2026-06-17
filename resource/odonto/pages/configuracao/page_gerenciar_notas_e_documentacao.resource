*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Gerenciar Notas e Documentações
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_gerenciar_notas}
    

    
    # Validação
    Wait For Elements State    ${config_gerenciar_notas_lbl_info_gerais}   state=visible
    Wait For Elements State    ${config_gerenciar_notas_lbl_info_operadora}    state=visible
    Wait For Elements State    ${config_gerenciar_notas_lbl_info_operadora}    state=visible
    Wait For Elements State    ${config_config_lbl_tipo_dado_odonto}    state=visible
