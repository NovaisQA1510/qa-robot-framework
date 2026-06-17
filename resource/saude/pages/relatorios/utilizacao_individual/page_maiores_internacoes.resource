*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Maiores Internações
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_individual_maiores_internações} 
    
    # Validação
    Wait For Elements State    ${relatorio_maiores_internacoes_lbl_maiores_internacoes}     state=visible
    Wait For Elements State    ${relatorio_maiores_internacoes_btn_csv}                      state=visible