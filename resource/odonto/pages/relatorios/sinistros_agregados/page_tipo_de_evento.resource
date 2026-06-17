*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação para Relatórios - Tipo de Evento 
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_sinistros_agregados_tipo_de_evento}
    
    # Validação
    Wait For Elements State    ${tipo_de_evento_lbl_sinistro_por_tipo_de_evento}   state=visible
    Wait For Elements State    ${tipo_de_evento_btn_csv}    state=visible
    
    