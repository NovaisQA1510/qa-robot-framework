*** Variables ***

${config_config_lbl_parametros}                xpath=//h4[contains(text(),"PARÂMETROS DO RELATÓRIO")]
${config_config_lbl_layout}                    xpath=//h4[contains(text(),"LAYOUT E FAVORITOS")]
${config_config_ddl_empresa}                   xpath=*//div[@id='tab-config-saude']//label[@title="Seleciona uma Empresa"]/following-sibling::div/select[@id="id_empresa"]/following-sibling::div/button
${config_config_ddl_operadora}                 xpath=*//label[@title="Selecione uma ou mais operadoras"]/following-sibling::div/select[@id="seguradoras-opt"]/following-sibling::div/button
${config_config_ddl_agrupamento}               xpath=*//div[@id='tab-config-saude']//label[@name="agrupamentos"]/following-sibling::div/select[@id="agrupamentos"]/following-sibling::div/button
${config_config_ddl_subestipulante}            xpath=*//div[@id='tab-config-saude']//label[@name="subestipulantes"]/following-sibling::div/select[@id="subestipulantes"]/following-sibling::div/button
${config_config_lbl_info_estipulante}          xpath=//div[@class="info-config-box"]//label[@id="info-estipulante"]
${config_config_lbl_info_seguradora}           xpath=//div[@class="info-config-box"]//label[@id="info-seguradora"]
${config_config_btn_feechar}                   xpath=*//button[contains(text(),"Fechar")]
${config_config_lbl_info_periodo}              xpath=//div[@class="info-config-box"]//label[@id="info-periodo"]
${config_config_btn_relatorio_saude}           xpath=//*[@id="content"]//ul[@class="nav nav-tabs"]//*[contains(text(),"Relatórios de Saúde")]
${config_config_lbl_tipo_dado}                 xpath=*//div[@class="info-config-text"]//label[@id="info-odonto-saude"][contains(text(),"Saúde")]
${config_config_btn_salvar}                    xpath=*//div[@id="tab-config-saude"]//button[@id="button_submit_saude"]
${erro_CDbException}                           xpath=//h1[normalize-space(text())="CDbException"]
${erro_php_code}                               xpath=//div[@class='source']//div[@class='code']
${erro_php_traces}                             xpath=//div[@class='traces']