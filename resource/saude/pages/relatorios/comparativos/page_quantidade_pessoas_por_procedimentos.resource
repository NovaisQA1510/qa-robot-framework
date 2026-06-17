*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Quantidade Pessoas por Procedimentos
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_comparativos_quantidade_pessoas_por_procedimento} 

    # Validação
    Wait For Elements State    ${relatorio_quantidade_pessoas_por_procedimentos_lbl_pessoas_por_procedimento}               state=visible
    Wait For Elements State    ${relatorio_quantidade_pessoas_por_procedimentos_btn_csv}                                    state=visible
    Wait For Elements State    ${relatorio_quantidade_pessoas_por_procedimentos_btn_next}                                   state=visible
    Wait For Elements State    ${relatorio_quantidade_pessoas_por_procedimentos_btn_previous}                               state=visible