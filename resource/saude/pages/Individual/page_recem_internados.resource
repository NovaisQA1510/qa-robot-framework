*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Individual Recem Internados
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_recem_internados}
    
    # Validação
    Wait For Elements State    ${individual_recem_internados_lbl_recem_internados}   state=visible
    Wait For Elements State    ${individual_recem_internados_btn_filtrar}            state=visible
    Wait For Elements State    ${individual_recem_internados_btn_CSV}                state=visible