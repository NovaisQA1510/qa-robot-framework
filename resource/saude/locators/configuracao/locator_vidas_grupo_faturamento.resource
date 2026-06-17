*** Variables ***

${config_vidas_lbl_vidas_faturamento}              xpath=*//h2[contains(text(),"Vidas por Grupo de Faturamento - ")]
${config_vidas_btn_csv}                            id=csv
${config_vidas_ddl_selecionar_empresa}             xpath=*//label[contains(text(),"Grupos Faturamento")]/..//button/span[@class="multiselect-selected-text"]
${config_vidas_ddl_selecionar_todas_empresas}      xpath=*//div[contains(@class,'btn-group') and contains(@class,'open')]//label[normalize-space()='Selecionar todos']
${config_vidas_btn_enviar}                         xpath=*//button[@type="submit"]