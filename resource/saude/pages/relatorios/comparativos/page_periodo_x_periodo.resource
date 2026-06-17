*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Periodo x Periodo
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_comparativos_periodo_x_periodo} 

    # Validação
    Wait For Elements State    ${relatorio_periodo_x_periodo_lbl_kpis_comparativo_por_periodo_selecionado}                     state=visible
    Wait For Elements State    ${relatorio_periodo_x_periodo_btn_csv}                                                          state=visible
    Wait For Elements State    ${relatorio_periodo_x_periodo_btn_filtrar}                                                      state=visible
    # Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_lbl_Grafico_custo_tipo_evento}      state=visible
    # Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_lbl_Grafico_custo_por_evento}       state=visible
