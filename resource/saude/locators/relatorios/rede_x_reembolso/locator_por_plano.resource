*** Variables ***
${relatorio_rede_reembolso_por_plano_lbl_sinistro_fonte_plano}        xpath=*//h2[normalize-space() = 'Sinistro Fonte por Plano']
${relatorio_rede_reembolso_por_plano_btn_csv}                         xpath=*//button[@id="csv"]
${relatorio_rede_reembolso_por_plano_lbl_grafico}                     xpath=//*[@id="chartobject-1"]//*[contains(text(),"Total de Sinistro em Reembolso por Plano")]