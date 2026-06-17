*** Variables ***

${config_config_lbl_parametros}                xpath=//h4[contains(text(),"PARÂMETROS DO RELATÓRIO")]
${config_config_ddl_empresa}                   xpath=//div[@id="tab-config-odonto"]//label[@title="Seleciona uma Empresa"]/following-sibling::div/select[@id="id_empresa"]/following-sibling::div/button
${config_config_ddl_operadora}                 xpath=*//label[@title="Selecione uma ou mais operadoras"]/following-sibling::div/select[@id="seguradoras"]/following-sibling::div/button
${config_config_ddl_subestipulante}            xpath=//div[@id="tab-config-odonto"]//label[@name="subestipulantes"]/following-sibling::div/select[@id="subestipulantes"]/following-sibling::div/button
${config_config_lbl_info_estipulante}          xpath=//div[@class="info-config-box"]//label[@id="info-estipulante"]
${config_config_lbl_info_seguradora}           xpath=//div[@class="info-config-box"]//label[@id="info-seguradora"]
${config_config_lbl_info_subestipulante}       xpath=//div[@class="info-config-box"]//h3[contains(text(),"Subestipulante")]/following-sibling::label[@id="info-subestipulante-numero"] 
${config_config_btn_feechar}                   xpath=*//button[contains(text(),"Fechar")]
${config_config_lbl_info_periodo}              xpath=//div[@class="info-config-box"]//label[@id="info-periodo"]
${config_config_btn_relatorios_odonto}         xpath=//*[@id="content"]//ul[@class="nav nav-tabs"]//*[contains(text(),"Relatórios de Odonto")]
${config_config_lbl_tipo_dado_odonto}          xpath=*//div[@class="info-config-text"]//label[@id="info-odonto-saude"][contains(text(),"Odonto")]
${config_config_lbl_info_periodo_inicio}       xpath=*//div[@id="tab-config-odonto"]//div[@class="col-sm-3"]//div[@class="input-group"]//select[@id="periodo_ini"]          
${config_config_lbl_info_periodo_fim}          xpath=*//div[@id="tab-config-odonto"]//div[@class="col-sm-3"]//div[@class="input-group"]//select[@id="periodo_fim"]
${config_config_btn_salvar}                    xpath=*//div[@id="tab-config-odonto"]//button[@id="button_submit_odonto"]