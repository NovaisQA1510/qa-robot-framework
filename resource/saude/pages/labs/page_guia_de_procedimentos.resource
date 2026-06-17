*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Labs Guias de Procedimentos
    # Navegação
    Click    ${mnu_labs}
    Click    ${mnu_labs_guia_de_procedimentos} 
    
    # Validação
    Wait For Elements State    ${guias_procedimentos_lbl_guias_procedimentos}       state=visible
    Wait For Elements State    ${guias_procedimentos_table_data}                    state=visible
    Wait For Elements State    ${guias_procedimentos_table_total_de_guias}          state=visible
    Wait For Elements State    ${guias_procedimentos_table_medias}                  state=visible
    Wait For Elements State    ${guias_procedimentos_lbl_guias_x_procedimentos}     state=visible