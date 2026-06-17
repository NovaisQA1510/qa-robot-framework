*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Scripts de Navegação
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_script_de_selecao}
    
    # Validação
    Wait For Elements State    ${individual_scripts_de_selecao_lbl_scripts_de_selecao}       state=visible
    Wait For Elements State    ${individual_scripts_de_selecao_lbl_filtros_de_seguradora}    state=visible
    Wait For Elements State    ${individual_scripts_de_selecao_lbl_filtros_de_rh}            state=visible
    Wait For Elements State    ${individual_scripts_de_selecao_lbl_buscar_salvar}            state=visible
    Wait For Elements State    ${individual_scripts_de_selecao_btn_filtrar}                  state=visible
