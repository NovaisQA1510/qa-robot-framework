*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Hiperconsultadores
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_individual_hiperconsultadores} 

    # Validação
    Wait For Elements State    ${relatorio_hiperconsultadores_lbl_hiperconsultadores}     state=visible
    Wait For Elements State    ${relatorio_hiperconsultadores_btn_csv}                    state=visible