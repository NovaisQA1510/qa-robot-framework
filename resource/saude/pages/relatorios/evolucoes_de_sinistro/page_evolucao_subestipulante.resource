*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Evolução por Subestipulante
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_evolucoes_de_sinistro_evolucao_por_subestipulante} 

    # Validação
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_evolucao_por_subestipulante_lbl_Evolucao_subestipulante}   state=visible
    Wait For Elements State    ${relatorio_evolucoes_de_sinistro_evolucao_por_subestipulante_btn_csv}    state=visible
