*** Variables ***

${integracao_lbl_relatorio}            xpath=//h4[contains(text(),"Relatório")]
${integracao_btn_relatorio_medico}     xpath=*//a[@href="/powerBI?tipo_acesso=medico"] 

#Power BI
${IFRAME_XPATH}                        xpath=//iframe[@class="imagem_menor"]
${ELEMENT_XPATH}                       xpath=//div[@data-testid="visual-content-desc"]//span[@class="textRun" and text()='Plano de Saúde']

