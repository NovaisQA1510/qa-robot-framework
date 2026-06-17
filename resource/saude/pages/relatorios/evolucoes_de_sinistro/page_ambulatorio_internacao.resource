*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Ambulatorio X Internação 
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_ambulatorial_x_internacao} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_lbl_evolucao_de_outros_custos}      state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_btn_csv}                            state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_lbl_Grafico_custo_tipo_evento}      state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_lbl_Grafico_custo_por_evento}       state=visible
