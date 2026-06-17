*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Individual Uso Constante
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_uso_constante}
    
    # Validação
    Wait For Elements State    ${individual_uso_constante_lbl_utilizacao_constante}   state=visible
    Wait For Elements State    ${individual_uso_constante_btn_CSV}                state=visible
    Wait For Elements State    ${individual_uso_constante_btn_buscar}                state=visible