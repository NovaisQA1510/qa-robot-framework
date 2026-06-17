*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Valores Agregados  
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_rede_x_reembolso_valores_agregados} 

    
    # Validação
    Wait For Elements State    ${relatorio_rede_reembolso_valores_agregados_lbl_rede_ou_reembolso}   state=visible
    Wait For Elements State    ${relatorio_rede_reembolso_valores_agregados_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_rede_reembolso_valores_agregados_lbl_grafico}    state=visible
    