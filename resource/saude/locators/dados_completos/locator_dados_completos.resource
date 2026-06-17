*** Variables ***

${dados_completos_lbl_nova_requisicao}          text=Dados Completos (nova requisição)
${dados_completos_lbl_download}                 text=Dados Completos (download)
${dados_completo_lbl_message_limite}            text=Esse período possui mais de 1.000.000 de registros. Por favor, escolha uma configuração diferente!
${dados_completos_tbl_qtd_pessoas}              xpath=//*[@id="saude"]/table/tbody/tr[1]/td[2]
${dados_completos_btn_download_pessoas}         xpath=*//a[@data-value="pessoa"][@title="Fazer download"]
${dados_completos_btn_OK}                       xpath=*//button[contains(text(),"OK")]
${dados_completos_lbl_filtro_pessoas}           xpath=*//h4[@id="exampleModalLongTitle"][contains(text(),"Filtros - Pessoas")] 
${dados_completos_btn_export_pessoas}           xpath=*//h4[contains(text(),"Filtros - Pessoas")]/../../div[@class="modal-footer"]//button
${dados_completos_btn_fechar_pessoas}           xpath=*//h4[contains(text(),"Filtros - Pessoas")]/../button


${dados_completos_tbl_qtd_evento}               xpath=//*[@id="saude"]/table/tbody/tr[2]/td[2]
${dados_completos_btn_download_evento}          xpath=*//a[@data-value="evento"][@title="Fazer download"]
${dados_completos_lbl_filtro_evento}            xpath=*//h4[@id="exampleModalLongTitle"][contains(text(),"Filtros - Eventos")] 
${dados_completos_btn_export_evento}            xpath=*//h4[contains(text(),"Filtros - Eventos")]/../../div[@class="modal-footer"]//button
${dados_completos_btn_fechar_evento}            xpath=*//h4[contains(text(),"Filtros - Eventos")]/../button
