*** Variables ***
${relatorio_ativos_X_desligados_lbl_pessoas_ativas_desligadas}            xpath=*//h2[normalize-space() = 'Pessoas ativas/desligadas']
${relatorio_ativos_x_desligados_slct_plano}                               xpath=*//select[@id='plano']
${relatorio_ativos_x_desligados_lbl_sinistro_per_capita}                  xpath=*//*[local-name()='text' and normalize-space(.)='Sinistro per Capita']
${relatorio_ativos_x_desligados_lbl_sinistro}                             xpath=*//*[local-name()='text' and normalize-space(.)='Sinistro']
${relatorio_ativos_x_desligados_lbl_vidas}                                xpath=*//*[local-name()='text' and normalize-space(.)='Vidas'] 