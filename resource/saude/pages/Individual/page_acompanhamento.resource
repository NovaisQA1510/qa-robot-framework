*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Individual Acompanhamento
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_acompanhamento}
    
    # Validação
    Wait For Elements State    ${individual_acompanhamento_lbl_gerenciamento_pessoas_programas}   state=visible
    Wait For Elements State    ${individual_acompanhamento_btn_filtrar}    state=visible