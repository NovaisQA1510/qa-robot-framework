*** Variables ***
${relatorio_sinistro_planos_lbl_sinistro_por_planos}              xpath=*//h2[normalize-space() = 'Sinistros por Planos']
${relatorio_sinistro_planos_btn_csv}                              xpath=*//button[@id="csv"]
${relatorio_sinistro_planos_btn_legenda_planos}                   xpath=*//button[@class="btn btn-default"]
${relatorio_sinistro_planos_lbl_tabela}                           xpath=//*[@id="table01"]//*[contains(text(),"Plano")]