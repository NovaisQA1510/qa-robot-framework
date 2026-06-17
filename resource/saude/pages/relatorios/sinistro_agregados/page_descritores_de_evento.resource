*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Sinistro Descritores de Evento 
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_sinistro_agregado_descritores_de_evento} 

    
    # Validação
    Wait For Elements State    ${relatorio_sinistro_descritores_de_evento_lbl_composicao_de_evento}   state=visible
    Wait For Elements State    ${relatorio_sinistro_descritores_de_evento_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_sinistro_descritores_de_evento_btn_filtrar}    state=visible
    