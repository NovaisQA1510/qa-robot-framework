*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Labs Benchmark Cruzados
    # Navegação
    Click    ${mnu_labs}
    Click    ${mnu_labs_benchmark_cruzados} 
    
    # Validação
    Wait For Elements State    ${labs_benchmark_cruzados_lbl_dados_benchmark}           state=visible
    Wait For Elements State    ${labs_benchmark_cruzados_btn_filtrar}                   state=visible
