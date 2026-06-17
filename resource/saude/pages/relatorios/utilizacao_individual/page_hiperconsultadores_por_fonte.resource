*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Hiperconsultadores Por Fonte
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_individual_hiperconsultadores_por_fonte} 

    
    # Validação
    Wait For Elements State    ${relatorio_hiperconsultadores_por_fonte_lbl_hiperconsultadores_em_reembolso}    state=visible
    Wait For Elements State    ${relatorio_hiperconsultadores_por_fonte_btn_csv}       state=visible