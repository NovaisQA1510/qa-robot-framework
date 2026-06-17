*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Sinistro X Vidas
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_comparativos_sinistro_x_vidas} 

    # Validação
    Wait For Elements State    ${relatorio_sinistro_x_vidas_lbl_evolucao_de_custos}                                          state=visible
    Wait For Elements State    ${relatorio_sinistro_x_vidas_btn_csv}                                                         state=visible
    Wait For Elements State    ${relatorio_sinistro_x_vidas_lbl_evolucao_custo_total_x_quantidade_de_vidas}                  state=visible
    Wait For Elements State    ${relatorio_sinistro_x_vidas_lbl_evolucao_per_capita}                                         state=visible
