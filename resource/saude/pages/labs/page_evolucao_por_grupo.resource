*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Labs    
    # Navegação
    Click    ${mnu_labs}
    Click    ${mnu_labs_evolucao_por_grupo} 
    
    # Validação
    Wait For Elements State    ${evolucao_por_grupo_lbl_evolucao_por_grupo}   state=visible
    Wait For Elements State    ${evolucao_por_grupo_btn_grupo}    state=visible