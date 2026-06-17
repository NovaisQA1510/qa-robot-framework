*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Labs Benchmark Procedimentos Unicos
    # Navegação
    Click    ${mnu_labs}
    Click    ${mnu_labs_benchmark_procedimentos_unicos} 
    
    # Validação
    Wait For Elements State    ${labs_benchmark_procedimentos_unicos_lbl_dados_benchmark}           state=visible
    Wait For Elements State    ${labs_benchmark_procedimentos_unicos_btn_filtrar}                   state=visible
    Wait For Elements State    ${labs_benchmark_procedimentos_unicos_btn_reset_filtros}             state=visible
