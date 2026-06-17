*** Variables ***
${relatorio_sinistro_planos_per_capita_lbl_quantidade_evento_per_capita}              xpath=*//h2[normalize-space() = 'Quantidade de Eventos Per Capita']
${relatorio_sinistro_planos_per_capita_btn_csv}                                       xpath=*//button[@id="csv"]
${relatorio_sinistro_planos_per_capita_btn_legenda_planos}                            xpath=*//button[@class="btn btn-default"]
${relatorio_sinistro_planos_per_capita_lbl_grafico}                                   xpath=//*[@id="chartContainer02"]//*[contains(text(),"Qtd. Eventos per Capita")]
${relatorio_sinistro_planos_per_capita_lbl_tabela}                                    xpath=//*[@id="table01"]//*[contains(text(),"Plano")]