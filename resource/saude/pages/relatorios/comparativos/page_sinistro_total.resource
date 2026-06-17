*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Sinistro Total
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_comparativos_sinitro_total} 

    # Validação
    Wait For Elements State    ${relatorio_sinistro_total_lbl_sinistro_consolidado_vs_microdados}                      state=visible
    Wait For Elements State    ${relatorio_sinistro_total_btn_csv}                                                     state=visible
