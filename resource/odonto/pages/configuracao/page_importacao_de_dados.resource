*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Importação de Dados
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_importacao_de_dados}
    
    # Validação
    Wait For Elements State    ${config_importacao_de_dados_lbl_listar}   state=visible
    Wait For Elements State    ${config_importacao_de_dados_btn_filtrar}    state=visible
    Wait For Elements State    ${config_config_lbl_tipo_dado_odonto}    state=visible
