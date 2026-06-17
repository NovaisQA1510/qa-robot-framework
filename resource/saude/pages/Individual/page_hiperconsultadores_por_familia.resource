*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Individual Hiperconsultadores Por Familia
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_hiperconsultadores_por_familia}
    
    # Validação
    Wait For Elements State    ${individual_hiperconsultadores_por_familia_lbl_hiperconsultadores_grupo_familiar}       state=visible
    Wait For Elements State    ${individual_hiperconsultadores_por_familia_btn_filtrar}                                 state=visible
    Wait For Elements State    ${individual_hiperconsultadores_por_familia_btn_CSV}                                     state=visible