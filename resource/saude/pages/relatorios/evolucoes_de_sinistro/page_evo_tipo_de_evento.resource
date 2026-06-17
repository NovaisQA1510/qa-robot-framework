*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Evo. Tipo de Evento
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_evo_tipo_de_evento} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_evo_tipo_de_evento_lbl_sinistro_por_tipo_evento}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_evo_tipo_de_evento_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_evo_tipo_de_evento_btn_buscar}    state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_evo_tipo_de_evento_lbl_Grafico}    state=visible
