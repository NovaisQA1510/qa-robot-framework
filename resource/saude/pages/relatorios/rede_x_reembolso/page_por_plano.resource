*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Pos Plano  
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_rede_x_reembolso_por_plano} 

    
    # Validação
    Wait For Elements State    ${relatorio_rede_reembolso_por_plano_lbl_sinistro_fonte_plano}   state=visible
    Wait For Elements State    ${relatorio_rede_reembolso_por_plano_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_rede_reembolso_por_plano_lbl_grafico}    state=visible
    