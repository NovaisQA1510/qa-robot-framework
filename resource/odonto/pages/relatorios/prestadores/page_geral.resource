*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação para Relatórios - Geral 
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_prestadores_geral}
    
    # Validação
    Wait For Elements State    ${prestadores_lbl_geral}     state=visible
    Wait For Elements State    ${prestadores_btn_csv}       state=visible

