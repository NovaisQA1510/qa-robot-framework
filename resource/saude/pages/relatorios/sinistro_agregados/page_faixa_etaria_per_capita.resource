*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação página Sinistro Faixa Etaria Per Capita
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_sinistro_agregado_faixa_etaria_per_capita} 

    
    # Validação
    Wait For Elements State    ${relatorio_sinistro_faixa_etaria_per_capita_lbl_faixa_etaria_per_capita}   state=visible
    Wait For Elements State    ${relatorio_sinistro_faixa_etaria_per_capita_btn_csv}    state=visible
