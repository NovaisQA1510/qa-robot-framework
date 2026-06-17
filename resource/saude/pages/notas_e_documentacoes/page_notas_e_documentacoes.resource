*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Notas e Documentações
    
    # Navegação
    Click    ${mnu_notas_e_documentacoes} 
    
    # Validação
    Wait For Elements State    ${notas_e_documentacao_lbl_info_geral}   state=visible
    Wait For Elements State    ${notas_e_documentacao_lbl_info_operadora}    state=visible