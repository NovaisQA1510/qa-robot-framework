*** Variables ***
${relatorio_sinistro_x_vidas_lbl_evolucao_de_custos}                                           xpath=*//h2[normalize-space() = 'Evolução de Custos']
${relatorio_sinistro_x_vidas_btn_csv}                                                          xpath=*//button[@id="csv"]
${relatorio_sinistro_x_vidas_lbl_evolucao_custo_total_x_quantidade_de_vidas}                   xpath=*//div[@id="chartContainer01"]//*[contains(text(),"Evolução custo total x Quantidade de vidas")]
${relatorio_sinistro_x_vidas_lbl_evolucao_per_capita}                                          xpath=*//div[@id="chartContainer02"]//*[contains(text(),"Evolução per capita")]