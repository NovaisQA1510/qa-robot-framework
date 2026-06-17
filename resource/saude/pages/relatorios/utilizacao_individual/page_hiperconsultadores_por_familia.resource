*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Hiperconsultores Por Família
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_individual_hiperconsultadores_por_familia} 

    
    # Validação
    Wait For Elements State    ${relatorio_hiperconsultadores_por_familia_lbl_hiperconsultadores_em_reembolso}     state=visible
    Wait For Elements State    ${relatorio_hiperconsultadores_por_familia_btn_csv}                                 state=visible