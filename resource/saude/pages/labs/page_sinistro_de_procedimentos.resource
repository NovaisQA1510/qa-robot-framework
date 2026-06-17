*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Labs Sinistro de Procedimentos
    # Navegação
    Click    ${mnu_labs}
    Click    ${mnu_labs_sinistro_de_procedimentos} 
    
    # Validação
    Wait For Elements State    ${sinistro_procedimentos_lbl_sinistralidade_por_procedimentos}       state=visible
    Wait For Elements State    ${sinistro_procedimentos_table_data}                    state=visible
    Wait For Elements State    ${sinistro_procedimentos_lbl_resultados_por_paginas}          state=visible    timeout=60
