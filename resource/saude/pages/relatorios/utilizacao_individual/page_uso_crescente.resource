*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Uso Crescente
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_individual_uso_cescente}

    # Validação
    Wait For Elements State    ${relatorio_uso_crescente_lbl_utilizacao_constante}     state=visible
    Wait For Elements State    ${relatorio_uso_crescente_btn_csv}                      state=visible