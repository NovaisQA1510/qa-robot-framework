*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Hiperexaminadores
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_individual_hiperexaminadores} 

    # Validação
    Wait For Elements State    ${relatorio_hiperexaminadores_lbl_hiperexaminadores}     state=visible
    Wait For Elements State    ${relatorio_hiperexaminadores_btn_csv}                   state=visible