*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Concentração de Custos
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_comparativos_concentracao_de_custos} 

    # Validação
    Wait For Elements State    ${relatorio_concentracao_de_custos_lbl_custo_total_x_beneficiarios_utilizadores}                                state=visible
    Wait For Elements State    ${relatorio_concentracao_de_custos_lbl_sinistro_por_faixa}                            state=visible
    # Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_lbl_Grafico_custo_tipo_evento}      state=visible
    # Wait For Elements State    ${relatorio_evolucoes_de_sinistro_ambulatorial_internacao_lbl_Grafico_custo_por_evento}       state=visible
