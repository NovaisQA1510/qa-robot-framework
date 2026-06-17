*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Individual Sem Eventos
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_sem_eventos}
    
    # Validação
    Wait For Elements State    ${individual_sem_eventos_lbl_sem_eventos}   state=visible
    Wait For Elements State    ${individual_sem_eventos_btn_buscar}                state=visible
    Wait For Elements State    ${individual_sem_eventos_btn_CSV}                state=visible