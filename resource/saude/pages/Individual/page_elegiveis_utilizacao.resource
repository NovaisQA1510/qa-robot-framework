*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Individual Elegiveis 
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_elegiveis_utilizacao}
    
    # Validação
    Wait For Elements State    ${individual_elegiveis_utilizacao_lbl_elegiveis}   state=visible
    Wait For Elements State    ${individual_elegiveis_utilizacao_btn_filtrar}     state=visible
    Wait For Elements State    ${individual_elegiveis_utilizacao_btn_CSV}         state=visible