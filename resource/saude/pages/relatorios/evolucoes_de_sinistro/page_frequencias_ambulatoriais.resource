*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Frequencias Ambulatoriais
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_frequencias_ambulatoriais} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_frequencia_ambulatoriais_lbl_evolucao_de_indicadores_amnulatoriai}      state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_frequencia_ambulatoriais_btn_csv}                            state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_frequencia_ambulatoriais_lbl_Grafico_custo_tipo_evento}      state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_frequencia_ambulatoriais_lbl_Grafico_exames_usuario_ano}       state=visible
