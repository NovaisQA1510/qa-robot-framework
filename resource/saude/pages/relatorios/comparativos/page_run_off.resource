*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Run Off
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_comparativos_run_off} 

    # Validação
    Wait For Elements State    ${relatorio_run_off_lbl_run_off_periodo_completo}       state=visible
    Wait For Elements State    ${relatorio_run_off_btn_csv}                            state=visible
    Wait For Elements State    ${relatorio_run_off_btn_filtrar}                        state=visible
    # Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_lbl_Grafico_custo_tipo_evento}      state=visible
    # Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_lbl_Grafico_custo_por_evento}       state=visible
