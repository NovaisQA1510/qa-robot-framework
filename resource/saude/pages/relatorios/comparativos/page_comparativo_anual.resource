*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Comparativo Anual
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_comparativos_comparativo_anual} 
    
    # Validação
    Wait For Elements State    ${relatorio_comparativo_anual_lbl_comparativo_anual}               state=visible
    Wait For Elements State    ${relatorio_comparativo_anual_btn_csv}                             state=visible
    Wait For Elements State    ${relatorio_comparativo_anual_btn_buscar}                          state=visible
    # Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_lbl_Grafico_custo_tipo_evento}      state=visible
    # Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_lbl_Grafico_custo_por_evento}       state=visible
