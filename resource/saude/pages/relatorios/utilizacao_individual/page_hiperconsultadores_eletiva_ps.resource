*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Hiperconsultores Eletiva PS
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_individual_hiperconsultadores_eletiva_ps} 

    
    # Validação
    Wait For Elements State    ${relatorio_hiperconsultadores_eletiva_ps_lbl_hiperconsultadores_em_reembolso}     state=visible
    Wait For Elements State    ${relatorio_hiperconsultadores_eletiva_ps_btn_csv}                                 state=visible