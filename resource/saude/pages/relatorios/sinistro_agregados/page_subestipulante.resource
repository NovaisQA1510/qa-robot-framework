*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Sinistro Subestipulante 
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_sinistro_agregado_subestipulante} 

    
    # Validação
    Wait For Elements State    ${relatorio_sinistro_subestipulante_lbl_sinistro_por_subestipulante}   state=visible
    Wait For Elements State    ${relatorio_sinistro_subestipulante_btn_csv}    state=visible
    Wait For Elements State    ${relatorio_sinistro_subestipulante_btn_filtra}    state=visible
    Wait For Elements State    ${relatorio_sinistro_subestipulante_lbl_subestipulantes}    state=visible
