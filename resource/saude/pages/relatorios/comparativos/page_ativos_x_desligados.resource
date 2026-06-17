*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Ativos X Desligados
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_comparativos_ativos_x_desligados} 

    # Validação
    Wait For Elements State    ${relatorio_ativos_X_desligados_lbl_pessoas_ativas_desligadas}                          state=visible
    Wait For Elements State    ${relatorio_ativos_x_desligados_slct_plano}                                             state=visible
    Wait For Elements State    ${relatorio_ativos_x_desligados_lbl_sinistro_per_capita}                                             state=visible
    Wait For Elements State    ${relatorio_ativos_x_desligados_lbl_sinistro}                                             state=visible
    Wait For Elements State    ${relatorio_ativos_x_desligados_lbl_vidas}                                             state=visible