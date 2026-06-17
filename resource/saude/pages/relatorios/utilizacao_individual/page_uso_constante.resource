*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Uso Constante
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_utilizacao_individual_uso_constante}
  
    # Validação
    Wait For Elements State    ${relatorio_uso_constante_lbl_utilizacao_constante}     state=visible
    Wait For Elements State    ${relatorio_uso_constante_btn_csv}                      state=visible