*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação para Relatórios - Perfil Demográfico
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_indicadores_demograficos_perfil_demografico}
    
    # Validação
    Wait For Elements State    ${perfil_demografico_lbl_perfil_da_populacao_atual}   state=visible
    Wait For Elements State    ${perfil_demografico_btn_csv}    state=visible
    
