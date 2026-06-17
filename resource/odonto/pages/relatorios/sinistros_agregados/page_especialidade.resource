*** Settings ***
Resource    ../../../utils/base.resource

*** Keywords ***
Navegação para Relatórios - Especialidade
    
    # Navegação
    Click    ${mnu_relatorio} 
    Click    ${mnu_relatorio_sinistros_agregados_especialidades}
    
    # Validação
    Wait For Elements State    ${especialidades_lbl_sinistro_por_especialidade_do_evento}         state=visible
    Wait For Elements State    ${tipo_de_evento_btn_csv}                                          state=visible
    Wait For Elements State    ${especialidade_btn_ultimo_mes}                                    state=visible
    Wait For Elements State    ${especialidades_lbl_sinistro_por_especialidade_do_evento}         state=visible    