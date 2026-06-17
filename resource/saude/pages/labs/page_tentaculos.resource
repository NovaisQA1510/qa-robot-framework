*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Labs Tentáculos
    # Navegação
    Click    ${mnu_labs}
    Click    ${mnu_labs_tentaculos} 
    
    # Validação
    Wait For Elements State    ${labs_tentaculos_lbl_interacao_start}       state=visible
    Wait For Elements State    ${labs_tentaculos_lbl_hc_consolidado}                    state=visible
